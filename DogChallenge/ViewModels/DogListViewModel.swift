//
//  DogListViewModel.swift
//  DogChallenge
//
//  Created by Tori Rosa on 2/3/23.
//

import Foundation

class DogListViewModel: ContentViewModeling {
	// MARK: - Published Objects

	@Published var error: Error?
	@Published var items: [String] = []
	@Published var isLoading = false
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

		let list: DogList = try await self.service.request(urlRequest: urlRequest)

		self.items = Array(list.message.filter {
			$0.value.count > 0
		}.keys).sorted(by: <)
		isLoading = false
	}

	// MARK: - Methods

	@MainActor
	func fetchData(item: String?) {
		guard items.isEmpty else { return }

		isLoading = true

		Task {
			do {
				let service = DogListService()
				try await request(service: service)
			} catch {
				showAlert = true
				self.error = error
				isLoading = false
			}
		}
	}
}
