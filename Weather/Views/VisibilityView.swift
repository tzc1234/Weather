//
//  VisibilityView.swift
//  Weather
//
//  Created by Tsz-Lung on 21/05/2022.
//

import SwiftUI

struct VisibilityView: View {
    let currentCondition: CurrentCondition?
    
    var body: some View {
        ChunkView {
            Label("visibility".uppercased(), systemImage: "eye.fill")
        } content: {
            VStack(alignment: .leading, spacing: 8.0) {
                Text((currentCondition?.visibilityStr).nilStr)
                    .font(.title2)
            }
            .foregroundColor(.white)
            .padding(.horizontal, 20.0)
        }

    }
}

struct VisibilityView_Previews: PreviewProvider {
    static var previews: some View {
        VisibilityView(currentCondition: nil)
    }
}
