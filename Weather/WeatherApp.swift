//
//  WeatherApp.swift
//  Weather
//
//  Created by Tsz-Lung on 10/05/2022.
//

import SwiftUI

@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            GeometryReader { proxy in
                HomeView(topEdge: proxy.safeAreaInsets.top)
                    .ignoresSafeArea(.all, edges: .top)
            }
        }
    }
}
