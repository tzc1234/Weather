//
//  UVIndexView.swift
//  Weather
//
//  Created by Tsz-Lung on 21/05/2022.
//

import SwiftUI

struct UVIndexView: View {
    var body: some View {
        ChunkView {
            Label("UV index".uppercased(), systemImage: "sun.max.fill")
        } content: {
            VStack(alignment: .leading, spacing: 3.0) {
                Text("1")
                    .font(.title2)
                    .bold()
                
                Text("Low")
                    .font(.headline)
                    .fontWeight(.semibold)
            }
        }
        .foregroundColor(.white)

    }
}

struct UVIndexView_Previews: PreviewProvider {
    static var previews: some View {
        UVIndexView()
    }
}
