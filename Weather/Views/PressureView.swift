//
//  PressureView.swift
//  Weather
//
//  Created by Tsz-Lung on 21/05/2022.
//

import SwiftUI

struct PressureView: View {
    let currentCondition: CurrentCondition?
    
    var body: some View {
        ChunkView {
            Label("pressure".uppercased(), systemImage: "gauge")
        } content: {
            VStack(alignment: .leading, spacing: 8.0) {
                Text((currentCondition?.pressureStr).nilStr)
                    .font(.title2)
            }
            .foregroundColor(.white)
            .padding(.horizontal, 20.0)
        }
        
    }
}

struct PressureView_Previews: PreviewProvider {
    static var previews: some View {
        PressureView(currentCondition: nil)
    }
}
