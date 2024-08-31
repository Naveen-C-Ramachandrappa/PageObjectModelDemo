//
//  DogImages.swift
//  DogChallenge
//
//  Created by Naveen Ramachandrappa on 2/3/23.
//

struct DogImages: Decodable {
	let items: [String]

	enum CodingKeys: String, CodingKey {
		case items = "message"
	}
}
