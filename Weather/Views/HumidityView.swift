//
//  HumidityView.swift
//  Weather
//
//  Created by Tsz-Lung on 21/05/2022.
//

import SwiftUI

struct HumidityView: View {
    let currentCondition: CurrentCondition?
    
    var body: some View {
        ChunkView {
            Label("humidity".uppercased(), systemImage: "humidity")
        } content: {
            VStack(alignment: .leading, spacing: 8.0) {
                Text((currentCondition?.humidity).nilStr)
                    .font(.title2)
            }
            .foregroundColor(.white)
            .padding(.horizontal, 20.0)
        }

    }
}

struct HumidityView_Previews: PreviewProvider {
    static var previews: some View {
        HumidityView(currentCondition: nil)
    }
}
