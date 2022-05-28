//
//  RainFallView.swift
//  Weather
//
//  Created by Tsz-Lung on 28/05/2022.
//

import SwiftUI

struct RainFallView: View {
    var body: some View {
        ChunkView {
            Label("rainfall".uppercased(), systemImage: "drop.fill")
        } content: {
            VStack(alignment: .leading, spacing: 0.0) {
                Text("0 mm")
                    .font(.title2)
                Text("in last 24 hours")
                    .font(.headline)
            }
            .foregroundColor(.white)
        }
    }
}

struct RainFallView_Previews: PreviewProvider {
    static var previews: some View {
        RainFallView()
    }
}
