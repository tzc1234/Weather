//
//  RainFallView.swift
//  Weather
//
//  Created by Tsz-Lung on 28/05/2022.
//

import SwiftUI

struct RainFallView: View {
    let currentCondition: CurrentCondition?
    
    var body: some View {
        ChunkView {
            Label("rainfall".uppercased(), systemImage: "drop.fill")
        } content: {
            VStack(alignment: .leading, spacing: 0.0) {
                Text((currentCondition?.rainfall24h).nilStr)
                    .font(.title2)
                Text("in last 24 hours")
                    .font(.headline)
            }
            .foregroundColor(.white)
            .padding(.horizontal, 20.0)
        }
    }
}

struct RainFallView_Previews: PreviewProvider {
    static var previews: some View {
        RainFallView(currentCondition: nil)
    }
}
