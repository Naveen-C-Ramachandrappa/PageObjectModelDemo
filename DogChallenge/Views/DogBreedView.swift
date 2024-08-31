//
//  DogBreedView.swift
//  DogChallenge
//
//  Created by Naveen Ramachandrappa on 2/3/23.
//

import SwiftUI

struct DogBreedView: View{
	// MARK: - Properties

	var item: String

	// MARK: - View

	var body: some View {
		NavigationLink(destination: DogImageView(viewModel: DogImageImageModel(), item: item)) {
			Text(item.localizedCapitalized)
				.modifier(DogBreedViewTextModifier())
		}
		.navigationTitle(Constants.title.rawValue)
	}
}
