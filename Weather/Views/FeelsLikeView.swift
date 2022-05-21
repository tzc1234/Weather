//
//  FeelsLikeView.swift
//  Weather
//
//  Created by Tsz-Lung on 21/05/2022.
//

import SwiftUI

struct FeelsLikeView: View {
    var body: some View {
        ChunkView {
            Label("feels like".uppercased(), systemImage: "thermometer")
        } content: {
            VStack(alignment: .leading, spacing: 8.0) {
                Text("18°")
                    .font(.title2)
            }
            .foregroundColor(.white)
        }

    }
}

struct FeelsLikeView_Previews: PreviewProvider {
    static var previews: some View {
        FeelsLikeView()
    }
}
