//
//  DogImageView.swift
//  DogChallenge
//
//  Created by Naveen Ramachandrappa on 2/3/23.
//

import SwiftUI

struct DogImageView<ViewModel>: View where ViewModel: DogImageImageModel {
	// MARK: - Observed Objects

	@ObservedObject var viewModel: ViewModel
	@State var opacity = 0.0

	// MARK: - Properties

	var item: String

	// MARK: - View

	var body: some View {
		ZStack {
			GeometryReader { geometry in
				ContentListView(data: $viewModel.items, content: { item in
					AsyncImage(url: URL(string: item),
							   transaction: Transaction(animation: .easeInOut(duration: 0.3))) { state in
						switch state {
						case .success(let image):
							image
								.resizable()
								.clipped()
						case .failure:
							Image("default")

						default:
							ProgressView()
						}
					}
							   .modifier(DogImageListViewModifier(geometry: geometry))
				})
				.navigationTitle(item.localizedCapitalized)
				.navigationBarTitleDisplayMode(.inline)
				.task {
					viewModel.fetchData(item: item)
				}
			}

			if viewModel.isLoading {
				ProgressView()
			}
		}
	}
}

