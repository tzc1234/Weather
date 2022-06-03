//
//  Optional+Additions.swift
//  Weather
//
//  Created by Tsz-Lung on 28/05/2022.
//

import Foundation

// MARK: - NilSignable
protocol NilSignable {}

extension Int: NilSignable {}
extension Double: NilSignable {}
extension String: NilSignable {}

extension Optional where Wrapped: NilSignable {
    var nilStr: String {
        if let self = self {
            return "\(self)"
        } else {
            return .nilSign
        }
    }
}

// MARK: - Optional Double
extension Optional where Wrapped == Double {
    var tempStr: String {
        if let self = self {
            return "\(Int(self))°"
        } else {
            return .nilSign
        }
    }
}
