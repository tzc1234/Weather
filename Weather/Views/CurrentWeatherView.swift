//
//  CurrentWeatherView.swift
//  Weather
//
//  Created by Tsz-Lung on 10/05/2022.
//

import SwiftUI

struct CurrentWeatherView: View {
    
    @State private var locationTextHeight: CGFloat = 0.0
    @State private var tempTextHeight: CGFloat = 0.0
    @State private var bottomSubviewHeight: CGFloat = 0.0
    @State private var chunkViewOffsetY: CGFloat = 0.0
    
    private let bottomPadding: CGFloat = 20.0
    
    let topEdge: CGFloat
    let offsetY: CGFloat
    let geoPosition: GeoPosition?
    let currentCondition: CurrentCondition?
    let hiLoTemps: (hi: Int?, lo: Int?)
    
    var body: some View {
        VStack(spacing: 0.0) {
            locationText
            
            ZStack {
                tempText
                shortTempText
            }

            bottomSubview
        }
        .padding(.bottom, bottomPadding)
        .offset(y: getLittleUpwardOffsetY())
        .onPreferenceChange(CurrentWeatherLocHeightPreferenceKey.self) { height in
            locationTextHeight = height
        }
        .onPreferenceChange(CurrentWeatherTempHeightPreferenceKey.self) { height in
            tempTextHeight = height
        }
        .onPreferenceChange(CurrentWeatherBottomSubviewHeightPreferenceKey.self) { height in
            bottomSubviewHeight = height
        }
        .onChange(of: locationTextHeight + tempTextHeight + bottomSubviewHeight) { _ in
            let partialTempTextHeight = tempTextHeight - (.chunkViewTopEdge - topEdge - locationTextHeight)
            chunkViewOffsetY = partialTempTextHeight + bottomSubviewHeight + bottomPadding
        }
        
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView(
            topEdge: 25.0,
            offsetY: 0.0,
            geoPosition: nil,
            currentCondition: nil,
            hiLoTemps: (nil, nil)
        )
        .background(.black)
    }
}

// MARK: components
extension CurrentWeatherView {
    private var locationText: some View {
        Text((geoPosition?.englishName).nilStr)
            .font(.system(size: 28))
            .foregroundStyle(.white)
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .preference(
                            key: CurrentWeatherLocHeightPreferenceKey.self,
                            value: proxy.size.height
                        )
                }
            )
            .shadow(radius: 5.0)
    }
    
    private var tempText: some View {
        Text(" " + (currentCondition?.tempDouble).tempStr)
            .font(.system(size: 70))
            .fontWeight(.thin)
            .foregroundStyle(.white)
            .opacity(getTempTextOpacity())
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .preference(
                            key: CurrentWeatherTempHeightPreferenceKey.self,
                            value: proxy.size.height
                        )
                }
            )
            .shadow(radius: 5.0)
    }

    private var shortTempText: some View {
        Text((currentCondition?.shortTempStr).nilStr)
            .font(.callout)
            .foregroundStyle(.white)
            .frame(maxHeight: .infinity, alignment: .top)
            .shadow(radius: 5.0)
            .padding(.top, 1.0)
            .opacity(getShortTempOpacity())
    }
    
    private var bottomSubview: some View {
        VStack(spacing: 0.0) {
            Text((currentCondition?.weatherText).nilStr)
            Text("H:\(hiLoTemps.hi.nilStr)° L:\(hiLoTemps.lo.nilStr)°")
        }
        .font(.callout)
        .foregroundStyle(.white)
        .shadow(radius: 5.0)
        .opacity(getBottomSubviewOpacity())
        .background(
            GeometryReader { proxy in
                Color.clear
                    .preference(
                        key: CurrentWeatherBottomSubviewHeightPreferenceKey.self,
                        value: proxy.size.height
                    )
            }
        )
    }
}

// MARK: functions
extension CurrentWeatherView {
    // Drag upward, this CurrentWeatherView will have a little move upward.
    private func getLittleUpwardOffsetY() -> CGFloat {
        let upwardLimit: CGFloat = 12.0
        if offsetY < 0.0 {
            let progress = offsetY / .chunkViewTopEdge * upwardLimit
            let newOffset = progress < -upwardLimit ? -upwardLimit : progress
            return newOffset
        }
        return 0.0
    }
    
    private func getBottomSubviewOpacity() -> Double {
        let end = bottomSubviewHeight + bottomPadding + 3
        let offsetY = -offsetY
        
        if offsetY >= end {
            return 0.0
        }
        
        let opacity = abs(offsetY - end) / end
        return opacity
    }
    
    private func getTempTextOpacity() -> Double {
        let start = bottomSubviewHeight + bottomPadding
        let diff = chunkViewOffsetY - start
        let offsetY = -offsetY
        
        if offsetY >= start {
            return 1.0 - ((offsetY - start) / diff)
        }
        
        return 1.0
    }
    
    private func getShortTempOpacity() -> Double {
        if -offsetY >= chunkViewOffsetY {
            return (-offsetY - chunkViewOffsetY) * 0.05
        }
        return 0.0
    }
}
