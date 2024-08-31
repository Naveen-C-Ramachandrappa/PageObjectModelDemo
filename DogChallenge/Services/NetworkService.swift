//
//  NetworkService.swift
//  DogChallenge
//
//  Created by Naveen Ramachandrappa on 2/3/23.
//

import Foundation

struct NetworkService: NetworkServicing {
	// MARK: - Methods

	func request<DataType: Decodable>(urlRequest: URLRequest?) async throws -> DataType {
		guard let urlRequest = urlRequest else {
			throw NetworkError.invalidRequest
		}

		let (data, response) = try await URLSession.shared.data(for: urlRequest)

		guard (response as? HTTPURLResponse)?.statusCode == 200 else {
			throw NetworkError.invalidResponse
		}

		return try JSONDecoder().decode(DataType.self, from: data)
	}
}

protocol  NetworkServicing {
	func request<DataType: Decodable>(urlRequest: URLRequest?) async throws -> DataType
}

