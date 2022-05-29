//
//  ForecastColumnView.swift
//  Weather
//
//  Created by Tsz-Lung on 10/05/2022.
//

import SwiftUI

struct ForecastColumnView: View {
    let time: String
    let weatherIcon: WeatherIcon
    let tempStr: String
    
    var body: some View {
        VStack(spacing: 16.0) {
            Text(time)
                .font(.callout)
                .bold()
            
            weatherIcon.image
                .font(.title2)
            
            Text(tempStr)
                .font(.callout)
                .bold()
        }
    }
}

struct ForecastColumnView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastColumnView(time: "Now", weatherIcon: .clear, tempStr: "20°")
    }
}
