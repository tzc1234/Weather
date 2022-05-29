//
//  NetworkManager.swift
//  Weather
//
//  Created by Tsz-Lung on 28/05/2022.
//

import Foundation

protocol NetworkManager {
    func fetchCurrentConditions() async throws -> [CurrentCondition]
}

final class MockNetworkManager: NetworkManager {
    static let shared = MockNetworkManager()
    private init() {}
    
    func fetchCurrentConditions() async throws -> [CurrentCondition] {
        guard
            let url = Bundle.main.url(forResource: "currentConditions.json", withExtension: nil)
        else {
            throw NetworkError.urlInvalid
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            return try JSONDecoder().decode([CurrentCondition].self, from: data)
        } catch {
            throw NetworkError.dataDecodeFailure(error)
        }
    }
}
