//
//  PressureView.swift
//  Weather
//
//  Created by Tsz-Lung on 21/05/2022.
//

import SwiftUI

struct PressureView: View {
    var body: some View {
        ChunkView {
            Label("pressure".uppercased(), systemImage: "gauge")
        } content: {
            VStack(alignment: .leading, spacing: 8.0) {
                Text("1003.5 mb")
                    .font(.title2)
            }
            .foregroundColor(.white)
        }

    }
}

struct PressureView_Previews: PreviewProvider {
    static var previews: some View {
        PressureView()
    }
}
