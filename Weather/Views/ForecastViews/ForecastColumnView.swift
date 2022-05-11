//
//  ForecastColumnView.swift
//  Weather
//
//  Created by Tsz-Lung on 10/05/2022.
//

import SwiftUI

struct ForecastColumnView: View {
    
    let time: String
    let imageName: String
    let celsius: Double
    
    var body: some View {
        VStack(spacing: 16.0) {
            Text(time)
                .font(.callout)
                .bold()
            
            Image(systemName: imageName)
                .font(.title2)
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, .yellow)
            
            Text("\(String(format: "%.0f", celsius))°")
                .font(.callout)
                .bold()
        }
    }
}

struct ForecastColumnView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastColumnView(time: "Now", imageName: "cloud.sun.fill", celsius: 20.5)
    }
}
