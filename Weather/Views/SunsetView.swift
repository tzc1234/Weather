//
//  SunsetView.swift
//  Weather
//
//  Created by Tsz-Lung on 21/05/2022.
//

import SwiftUI

struct SunsetView: View {
    var body: some View {
        ChunkView {
            Label("sunset".uppercased(), systemImage: "sunset.fill")
        } content: {
            VStack(alignment: .leading) {
                Text("20:54")
                    .font(.title2)
            }
            .foregroundColor(.white)

        }

    }
}

struct SunsetView_Previews: PreviewProvider {
    static var previews: some View {
        SunsetView()
    }
}
