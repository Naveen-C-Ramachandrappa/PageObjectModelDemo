//
//  DogBreedViewTextModifier.swift
//  DogChallenge
//
//  Created by Naveen Ramachandrappa on 2/3/23.
//

import SwiftUI

struct DogBreedViewTextModifier: ViewModifier {
	// MARK: - Methods

	func body(content: Content) -> some View {
		content
			.multilineTextAlignment(.center)
			.tint(.orange)
			.font(.largeTitle)
			.frame(maxWidth: .infinity, alignment: .leading)
			.padding(20)
	}
}
