//
//  HTTPURLResponse+Additions.swift
//  Weather
//
//  Created by Tsz-Lung on 28/05/2022.
//

import Foundation

extension HTTPURLResponse {
    var isSuccess: Bool {
        200..<300 ~= statusCode
    }
}
