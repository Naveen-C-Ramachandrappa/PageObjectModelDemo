//
//  DogImageImageModel.swift
//  DogChallenge
//
//  Created by Tori Rosa on 2/3/23.
//

import SwiftUI

class DogImageImageModel: ContentViewModeling {
	// MARK: - Published Objects

	@Published var error: Error?
	@Published var isLoading = false
	@Published var items: [String] = []
	@Published var showAlert = false

	// MARK: - Properties

	var service: NetworkServicing

	// MARK: - Intializer

	init(service: NetworkServicing = NetworkService()) {
		self.service = service
	}

	// MARK: - Private Methods

	@MainActor
	private func request(service: any DogServicing) async throws -> Void {
		let urlRequest = service.urlRequest()

		let list: DogImages = try await self.service.request(urlRequest: urlRequest)

		self.items = list.items
		isLoading = false
	}

	// MARK: - Methods

	@MainActor
	func fetchData(item: String?) {
		guard items.isEmpty, let item = item else { return }

		isLoading = true

		Task {
			do {
				let service = DogImageService(breed: item)
				try await request(service: service)
			} catch {
				isLoading = false
			}
		}
	}
}
