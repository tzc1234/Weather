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
    
    let threshold: CGFloat = 12.0
    let bottomPadding: CGFloat = 20.0
    
    let topEdge: CGFloat
    let offsetY: CGFloat
    
    var body: some View {
        VStack(spacing: 0.0) {
            Text("London")
                .font(.system(size: 28))
                .foregroundStyle(.white)
                .background(
                    GeometryReader { proxy -> Color in
                        DispatchQueue.main.async {
                            locationTextHeight = proxy.size.height
                        }
                        return .clear
                    }
                )
                .shadow(radius: 5.0)
            
            ZStack {
                Text(" 16°")
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
                
                Text("16° | Haze")
                    .font(.callout)
                    .foregroundStyle(.white)
                    .frame(maxHeight: .infinity, alignment: .top)
                    .shadow(radius: 5.0)
                    .padding(.top, 1.0)
                    .opacity(getShortTempOpacity())
            }

            bottomSubview
        }
        .padding(.bottom, bottomPadding)
        .background(
            GeometryReader { proxy -> Color in
                DispatchQueue.main.async {
//                    print("offsetY: \(-offsetY)")
                    let partialTempTextHeight = tempTextHeight - (.chunkViewTopEdge - topEdge - locationTextHeight)
                    chunkViewOffsetY = partialTempTextHeight + bottomSubviewHeight + bottomPadding
//                    print("chunkViewOffsetY: \(chunkViewOffsetY)")
                }
                
                return .clear
            }
        )
//        .offset(y: getLittleUpwardOffsetY())
        .onPreferenceChange(CurrentWeatherBottomSubviewHeightPreferenceKey.self) { height in
            bottomSubviewHeight = height
        }
        .onPreferenceChange(CurrentWeatherTempHeightPreferenceKey.self) { height in
            tempTextHeight = height
        }
        
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView(topEdge: 25.0, offsetY: 0.0)
            .background(.black)
    }
}

// MARK: components
extension CurrentWeatherView {
    private var bottomSubview: some View {
        VStack(spacing: 0.0) {
            Text("Haze")
            Text("H:20° L:12°")
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
        if offsetY < 0.0 {
            let progress = offsetY / 120.0 * threshold
            let newOffset = progress < -threshold ? -threshold : progress
//            print("offsetY: \(offsetY)")
//            print("offsetY / 120.0: \(offsetY / 120.0)")
            
//            print("littleUpwardOffsetY: \(newOffset)")
//            print("x: \(bottomSubviewHeight + bottomPadding + -newOffset)")
            
            return newOffset
        }
        return 0.0
    }
    
    private func getBottomSubviewOpacity() -> Double {
        let progress = abs(getLittleUpwardOffsetY()) / 8
        let opacity = 1.0 - progress
        return opacity
    }
    
    private func getTempTextOpacity() -> Double {
        let bottomLimit = bottomSubviewHeight + bottomPadding
        let diff = chunkViewOffsetY - bottomLimit
        let offsetY = -offsetY
        
        if offsetY >= bottomLimit {
            return 1.0 - ((offsetY - bottomLimit) / diff)
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
