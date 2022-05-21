//
//  WindView.swift
//  Weather
//
//  Created by Tsz-Lung on 21/05/2022.
//

import SwiftUI

struct WindView: View {
    var body: some View {
        ChunkView {
            Label("wind".uppercased(), systemImage: "wind")
        } content: {
            VStack(alignment: .leading, spacing: 8.0) {
                Text("6.4 m/s")
                    .font(.title2)
            }
            .foregroundColor(.white)
        }

    }
}

struct WindView_Previews: PreviewProvider {
    static var previews: some View {
        WindView()
    }
}
