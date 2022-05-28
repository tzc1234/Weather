//
//  OptionalDouble+Additions.swift
//  Weather
//
//  Created by Tsz-Lung on 28/05/2022.
//

import Foundation

extension Optional where Wrapped == Double {
    var tempStr: String {
        if let self = self {
            return "\(Int(self))°"
        } else {
            return "-"
        }
    }
}
