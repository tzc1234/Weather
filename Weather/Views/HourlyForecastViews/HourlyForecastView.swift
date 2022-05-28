//
//  HourlyForecastView.swift
//  Weather
//
//  Created by Tsz-Lung on 11/05/2022.
//

import SwiftUI

struct HourlyForecastView: View {
    var body: some View {
        ChunkView {
            hourlyForecastLabel
        } content: {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16.0) {
                    ForecastColumnView(time: "Now", imageName: "cloud.sun.fill", celsius: 20)
                    
                    ForecastColumnView(time: "11", imageName: "cloud.sun.fill", celsius: 19)
                    
                    ForecastColumnView(time: "12", imageName: "cloud.sun.fill", celsius: 18)
                    
                    ForecastColumnView(time: "13", imageName: "cloud.sun.fill", celsius: 17.5)
                    
                    ForecastColumnView(time: "14", imageName: "cloud.sun.fill", celsius: 16.4)
                    
                    ForecastColumnView(time: "15", imageName: "cloud.sun.fill", celsius: 16)
                    
                    ForecastColumnView(time: "16", imageName: "cloud.sun.fill", celsius: 13)
                    
                    ForecastColumnView(time: "17", imageName: "cloud.sun.fill", celsius: 11)
                }
            }
        }
    }
}

struct HourlyForecastView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecastView()
    }
}

// MARK: components
extension HourlyForecastView {
    private var hourlyForecastLabel: some View {
        Label {
            Text("hourly forecast".uppercased())
        } icon: {
            Image(systemName: "clock")
        }
    }
}
