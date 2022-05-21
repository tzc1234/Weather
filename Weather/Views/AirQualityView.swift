//
//  AirQualityView.swift
//  Weather
//
//  Created by Tsz-Lung on 21/05/2022.
//

import SwiftUI

struct AirQualityView: View {
    var body: some View {
        ChunkView {
            Label("Air Quality".uppercased(), systemImage: "aqi.low")
        } content: {
            VStack(alignment: .leading, spacing: 8.0) {
                Text("2 - Good")
                    .font(.title3)
                    .bold()
                
                Text("Air quality is satisfactory, and air pollution poses little or no risk.")
                    .font(.caption)
                    .fontWeight(.semibold)
            }
            .foregroundColor(.white)
            
        }
    }
}

struct AirQualityView_Previews: PreviewProvider {
    static var previews: some View {
        AirQualityView()
    }
}
