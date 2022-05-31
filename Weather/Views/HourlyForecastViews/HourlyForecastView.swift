//
//  HourlyForecastView.swift
//  Weather
//
//  Created by Tsz-Lung on 11/05/2022.
//

import SwiftUI

struct HourlyForecastView: View {
    let hourlyForecasts: [HourlyForecast]
    
    var body: some View {
        ChunkView {
            hourlyForecastLabel
        } content: {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 24.0) {
                    ForEach(hourlyForecasts) { hourlyForecast in
                        ForecastColumnView(
                            time: hourlyForecast.hourStr,
                            weatherIcon: hourlyForecast.weatherIcon,
                            tempStr: hourlyForecast.tempStr
                        )
                    }
                }
            }
        }
    }
}

struct HourlyForecastView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecastView(hourlyForecasts: [])
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
