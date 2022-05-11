//
//  HomeView.swift
//  Weather
//
//  Created by Tsz-Lung on 10/05/2022.
//

import SwiftUI

struct HomeView: View {
    
    @State private var offset: CGFloat = 0.0
    
    private let currentWeatherViewOffsetThreshold: CGFloat = 12.0
    
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
                VStack(spacing: 20.0) {
                    CurrentWeatherView(opacity: getTitleOpacity())
                        .offset(y: -offset)
                        .offset(y: offset > 0 ? offset / .screenWidth * 100 : 0)
                        .offset(y: getTitleOffset())
                    
                    VStack {
                        ForEach(0...9, id: \.self) { _ in
                            HourlyForecastView()
                        }
                    }
                     
                }
                .padding(.top, 25)
                .padding(.top, topEdge)
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
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(topEdge: 0.0)
    }
}

// MARK: functions
extension HomeView {
    private func getTitleOffset() -> CGFloat {
        if offset < 0.0 {
            let progress = offset / 120.0 * currentWeatherViewOffsetThreshold
            let newOffset = progress < -currentWeatherViewOffsetThreshold ? -currentWeatherViewOffsetThreshold : progress
//            print("progress: \(progress), newOffset: \(newOffset)")
            return newOffset
        }
        return 0.0
    }
    
    private func getTitleOpacity() -> CGFloat {
        let progress = -getTitleOffset() / currentWeatherViewOffsetThreshold
        return 1.0 - progress
    }
}
