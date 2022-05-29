//
//  OptionalInt+Additions.swift
//  Weather
//
//  Created by Tsz-Lung on 29/05/2022.
//

import Foundation

extension Optional where Wrapped == Int {
    var nilStr: String {
        if let self = self {
            return String(self)
        } else {
            return .nilSign
        }
    }
}
