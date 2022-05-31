//
//  ChunkView.swift
//  Weather
//
//  Created by Tsz-Lung on 10/05/2022.
//

import SwiftUI

struct ChunkView<Title: View, Content: View>: View {
    
    @State private var offsetTop: CGFloat = 0.0
    @State private var offsetBottom: CGFloat = 0.0
    @State private var titleViewCornerRadius: CGFloat = 0.0
    
    private let titleViewHeight: CGFloat = 38.0
    
    let titleView: Title
    let content: Content
    
    init(@ViewBuilder title: () -> Title, @ViewBuilder content: () -> Content) {
        self.titleView = title()
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0.0) {
            titleView
                .font(.footnote)
                .lineLimit(1)
                .frame(height: titleViewHeight)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .background(.ultraThinMaterial)
                .clipShape(Corners(corners: [.topLeft, .topRight], radius: 12.0))
                .clipShape(
                    Corners(corners: [.bottomLeft, .bottomRight],
                            radius: titleViewCornerRadius)
                )
                .zIndex(1.0)
            
            VStack(spacing: 0.0) {
                content
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .frame(minHeight: 90.0)
                    .padding([.vertical])
                    .padding(.horizontal, 20.0)
            }
            .background(.ultraThinMaterial)
            .clipShape(Corners(corners: [.bottomLeft, .bottomRight], radius: 12.0))
            // Keep move the content part. Offset the offset affect on the outer VStack.
            .offset(y: offsetTop >= .chunkViewTopEdge ? 0.0 : -(.chunkViewTopEdge - offsetTop))
            .clipped()
            .opacity(getOpacity())
            
        }
        .preferredColorScheme(.dark)
        // Make the whole ChunkView stick to chunkViewTopEdge.
        .offset(y: offsetTop >= .chunkViewTopEdge ? 0.0 : .chunkViewTopEdge - offsetTop)
        .opacity(getOpacity())
        .background(
            GeometryReader { proxy -> Color in
                let frame = proxy.frame(in: .global)
                
                DispatchQueue.main.async {
                    offsetTop = frame.minY
                    offsetBottom = frame.maxY - .chunkViewTopEdge
                    
                    let threshold = titleViewHeight + 12.0 - 3.3
                    if offsetBottom < threshold {
                        if offsetBottom < titleViewHeight - 3.3 {
                            titleViewCornerRadius = 12.0
                        } else {
                            titleViewCornerRadius = threshold - offsetBottom
                        }
                    } else {
                        titleViewCornerRadius = 0.0
                    }
                }
                
                return .clear
            }
        )
        
    }
}

struct ChunkView_Previews: PreviewProvider {
    static var previews: some View {
        ChunkView(title: {}, content: {})
    }
}

// MARK: functions
extension ChunkView {
    private func getOpacity() -> CGFloat {
        if offsetBottom < titleViewHeight {
            let progress = offsetBottom / titleViewHeight
            return progress
        }
        return 1.0
    }
}
