//
//  WindView.swift
//  Weather
//
//  Created by Tsz-Lung on 21/05/2022.
//

import SwiftUI

struct WindView: View {
    let currentCondition: CurrentCondition?
    
    var body: some View {
        ChunkView {
            Label("wind".uppercased(), systemImage: "wind")
        } content: {
            VStack(alignment: .leading, spacing: 8.0) {
                Text((currentCondition?.windStr).nilStr)
                    .font(.title2)
            }
            .foregroundColor(.white)
            .padding(.horizontal, 20.0)
        }

    }
}

struct WindView_Previews: PreviewProvider {
    static var previews: some View {
        WindView(currentCondition: nil)
    }
}
