//
//  CurrentWeatherView.swift
//  Weather
//
//  Created by Tsz-Lung on 10/05/2022.
//

import SwiftUI

struct CurrentWeatherView: View {
    
    let opacity: CGFloat
    
    var body: some View {
        VStack(spacing: 0.0) {
            Text("London")
                .font(.system(size: 28))
                .foregroundStyle(.white)
                .shadow(radius: 5.0)
            
            Text(" 16°")
                .font(.system(size: 60))
                .fontWeight(.thin)
                .foregroundStyle(.white)
                .shadow(radius: 5.0)
                .opacity(opacity)
            
            Text("Haze")
                .font(.callout)
                .foregroundStyle(.white)
                .shadow(radius: 5.0)
                .opacity(opacity)
                
            Text("H:20° L:12°")
                .font(.callout)
                .foregroundStyle(.white)
                .shadow(radius: 5.0)
                .opacity(opacity)
        }
        
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView(opacity: 1.0)
            .background(.black)
    }
}
