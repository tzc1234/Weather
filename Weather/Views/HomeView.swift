//
//  HomeView.swift
//  Weather
//
//  Created by Tsz-Lung on 10/05/2022.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var vm = HomeViewModel(
        locationManager: WeatherLocationManager(),
        networkManager: WeatherNetworkManager()
    )
    
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
                    CurrentWeatherView(
                        topEdge: topConstant + topEdge,
                        offsetY: offset,
                        geoPosition: vm.geoPosition,
                        currentCondition: vm.currentCondition,
                        hiLoTemps: vm.hiLoTemps
                    )
                    .offset(y: -offset)
                    .offset(y: offset > 0 ? offset / .screenWidth * 100 : 0) // drag down effect.
                    
                    VStack(spacing: 10.0) {
                        HourlyForecastView(hourlyForecasts: vm.hourlyForecasts)
                        
                        HStack(spacing: 10.0) {
                            UVIndexView(currentCondition: vm.currentCondition)
                            RainFallView(currentCondition: vm.currentCondition)
                        }
                        
                        HStack(spacing: 10.0) {
                            FeelsLikeView(currentCondition: vm.currentCondition)
                            HumidityView(currentCondition: vm.currentCondition)
                        }
                        
                        HStack(spacing: 10.0) {
                            VisibilityView(currentCondition: vm.currentCondition)
                            PressureView(currentCondition: vm.currentCondition)
                        }
                        
                        HStack(spacing: 10.0) {
                            WindView(currentCondition: vm.currentCondition)
                            Spacer()
                                .frame(maxWidth: .infinity)
                        }
                    }
                }
                .padding(.top, topConstant + topEdge)
                .padding([.horizontal, .bottom])
                .background(
                    GeometryReader { proxy -> Color in
                        DispatchQueue.main.async {
                            offset = proxy.frame(in: .global).minY
                        }
                        return .clear
                    }
                )
            }
        }
        .onAppear {
            CGFloat.chunkViewTopEdge = topEdge > 20.0 ? 140.0 : 110.0
            vm.checkIfLocationServiceEnabled()
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(topEdge: 0.0)
    }
}
