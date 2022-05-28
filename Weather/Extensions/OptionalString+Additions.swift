//
//  OptionalString+Additions.swift
//  Weather
//
//  Created by Tsz-Lung on 28/05/2022.
//

import Foundation

extension Optional where Wrapped == String {
    var nilStr: String {
        if let self = self {
            return self
        } else {
            return "-"
        }
    }
}
