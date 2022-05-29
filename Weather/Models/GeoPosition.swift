//
//  GeoPosition.swift
//  Weather
//
//  Created by Tsz-Lung on 29/05/2022.
//

import Foundation

// MARK: - GeoPosition
struct GeoPosition: Codable {
    let key, englishName: String

    enum CodingKeys: String, CodingKey {
        case key = "Key"
        case englishName = "EnglishName"
    }
}
