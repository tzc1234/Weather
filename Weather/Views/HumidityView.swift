//
//  HumidityView.swift
//  Weather
//
//  Created by Tsz-Lung on 21/05/2022.
//

import SwiftUI

struct HumidityView: View {
    var body: some View {
        ChunkView {
            Label("humidity".uppercased(), systemImage: "humidity")
        } content: {
            VStack(alignment: .leading, spacing: 8.0) {
                Text("49%")
                    .font(.title2)
            }
            .foregroundColor(.white)
        }

    }
}

struct HumidityView_Previews: PreviewProvider {
    static var previews: some View {
        HumidityView()
    }
}
