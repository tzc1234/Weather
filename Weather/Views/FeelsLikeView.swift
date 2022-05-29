//
//  FeelsLikeView.swift
//  Weather
//
//  Created by Tsz-Lung on 21/05/2022.
//

import SwiftUI

struct FeelsLikeView: View {
    let currentCondition: CurrentCondition?
    
    var body: some View {
        ChunkView {
            Label("feels like".uppercased(), systemImage: "thermometer")
        } content: {
            VStack(alignment: .leading, spacing: 8.0) {
                Text((currentCondition?.feelsLike).nilStr)
                    .font(.title2)
            }
            .foregroundColor(.white)
        }

    }
}

struct FeelsLikeView_Previews: PreviewProvider {
    static var previews: some View {
        FeelsLikeView(currentCondition: nil)
    }
}
