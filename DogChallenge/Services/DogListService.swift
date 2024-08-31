//
//  DogService.swift
//  DogChallenge
//
//  Created by Naveen Ramachandrappa on 2/3/23.
//

import Foundation

class DogListService: DogServicing {
	// MARK: - Proverties

	private var url: String {
		Constants.baseUrl.rawValue + endpoint
	}
	private let endpoint = "breeds/list/all"

	// MARK: - Methods

	func urlRequest() -> URLRequest? {
		let allHttpHeaderFields: [String: String] = [:]
		let httpMethod: NetworkHttpMethod = .get
		let queryItems: [URLQueryItem] = []
		let params = NetworkParameters(allHttpHeaderFields: allHttpHeaderFields, httpMethod: httpMethod, queryItems: queryItems, url: url)

		return NetworkRequest(params: params).urlRequest
	}
}

protocol DogServicing: ObservableObject {
	func urlRequest() -> URLRequest?
}

