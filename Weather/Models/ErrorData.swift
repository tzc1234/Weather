//
//  ErrorData.swift
//  Weather
//
//  Created by Tsz-Lung on 01/06/2022.
//

import Foundation

struct ErrorData: Codable {
    let code, message, reference: String

    enum CodingKeys: String, CodingKey {
        case code = "Code"
        case message = "Message"
        case reference = "Reference"
    }
}
