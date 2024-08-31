//
//  ContentViewModeling.swift
//  DogChallenge
//
//  Created by Tori Rosa on 2/3/23.
//

import SwiftUI

protocol ContentViewModeling: ObservableObject {
	var error: Error? { get set }
	var isLoading: Bool { get set }
	var items: [String] { get set }
	var service: NetworkServicing { get set }
	var showAlert: Bool { get set }

	func fetchData(item: String?)
}

extension ContentViewModeling {
	func fetchData(item: String? = nil) {
		fetchData(item: item)
	}
}
