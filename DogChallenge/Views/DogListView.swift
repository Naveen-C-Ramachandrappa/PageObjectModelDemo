//
//  DogListView.swift
//  DogChallenge
//
//  Created by Naveen Ramachandrappa on 2/3/23.
//

import SwiftUI

struct DogListView<ViewModel>: View where ViewModel: ContentViewModeling {
	// MARK: - Observed Objects

	@ObservedObject var viewModel: ViewModel

	// MARK: - View

	var body: some View {
		ZStack {
			NavigationView {
				ContentListView(data: $viewModel.items) { item in
					DogBreedView(item: item)
				}
				.alert(isPresented: $viewModel.showAlert) {
					Alert(title: Text(Constants.errorTitle.rawValue),
						  message: Text(viewModel.error?.localizedDescription ?? ""),
						  dismissButton: .default(Text(Constants.tryAgain.rawValue)) {
						viewModel.showAlert = false
						viewModel.fetchData()
					})
				}
				.task {
					viewModel.fetchData()
				}
			}

			if viewModel.isLoading {
				ProgressView()
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		let viewModel = DogListViewModel()
		DogListView(viewModel: viewModel)
    }
}
