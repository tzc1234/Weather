//
//  HomeView.swift
//  Weather
//
//  Created by Tsz-Lung on 10/05/2022.
//

import SwiftUI

struct HomeView: View {
    
    @State private var offset: CGFloat = 0.0
    
    private let topConstant: CGFloat = 25.0
    
    let topEdge: CGFloat
    
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                Image("weather")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .overlay(.ultraThinMaterial)
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0.0) {
                    CurrentWeatherView(topEdge: topConstant + topEdge, offsetY: offset)
                        .offset(y: -offset)
                        .offset(y: offset > 0 ? offset / .screenWidth * 100 : 0) // drag down effect.
                    
                    HourlyForecastView()
                        .padding(.bottom, 20.0)
                    
                    Color.clear
                        .border(.black, width: 1.0)
                        .frame(height: 1400.0)
                }
                .padding(.top, topConstant + topEdge)
                .padding([.horizontal, .bottom])
                .overlay(
                    GeometryReader { proxy -> Color in
                        DispatchQueue.main.async {
                            offset = proxy.frame(in: .global).minY
                        }
                        return Color.clear
                    }
                )
                
            }
        }
        .onAppear {
            CGFloat.chunkViewTopEdge = topEdge > 20.0 ? 140.0 : 110.0
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(topEdge: 0.0)
    }
}
