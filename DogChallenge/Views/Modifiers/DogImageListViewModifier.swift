//
//  DogImageListViewModifier.swift
//  DogChallenge
//
//  Created by Naveen Ramachandrappa on 2/3/23.
//

import SwiftUI

struct DogImageListViewModifier: ViewModifier {
	// MARK: - Properties

	let geometry: GeometryProxy

	// MARK: - Methods

	func body(content: Content) -> some View {
		content
			.aspectRatio(contentMode: .fill)
			.background(.clear)
			.frame(width: geometry.size.width, height: geometry.size.width)
			.clipped()
	}
}
