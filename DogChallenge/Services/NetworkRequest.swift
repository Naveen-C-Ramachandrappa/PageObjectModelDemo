//
//  NetworkRequest.swift
//  DogChallenge
//
//  Created by Naveen Ramachandrappa on 2/3/23.
//

import Foundation

struct NetworkRequest {
	// MARK: - Properties

	var params: NetworkParameters

	var url: URL? {
		var components = URLComponents(string: params.url)
		components?.queryItems = params.queryItems
		return components?.url
	}

	var urlRequest: URLRequest? {
		guard let url = url else { return nil }

		var request = URLRequest(url: url)

		request.allHTTPHeaderFields = params.allHttpHeaderFields
		request.httpMethod = params.httpMethod.rawValue
		request.url = url

		return request
	}
}

protocol NetworkRequesting {
	var params: NetworkParameters { get set }
	var url: URL? { get }
	var urlRequest: URLRequest? { get }
}
