//
//  NetworkParameters.swift
//  DogChallenge
//
//  Created by Naveen Ramachandrappa on 2/3/23.
//

import Foundation

struct NetworkParameters {
	let allHttpHeaderFields: [String: String]
	let httpMethod: NetworkHttpMethod
	let queryItems: [URLQueryItem]
	let url: String
}
