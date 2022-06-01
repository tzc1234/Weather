//
//  UVIndexView.swift
//  Weather
//
//  Created by Tsz-Lung on 21/05/2022.
//

import SwiftUI

struct UVIndexView: View {
    let currentCondition: CurrentCondition?
    
    var body: some View {
        ChunkView {
            Label("UV index".uppercased(), systemImage: "sun.max.fill")
        } content: {
            VStack(alignment: .leading, spacing: 0.0) {
                Text((currentCondition?.uvIndex).nilStr)
                    .font(.title2)
                    .bold()
                
                Text((currentCondition?.uvIndexText).nilStr)
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            .padding(.horizontal, 20.0)
        }
        .foregroundColor(.white)
        
    }
}

struct UVIndexView_Previews: PreviewProvider {
    static var previews: some View {
        UVIndexView(currentCondition: nil)
    }
}
