//
//  DogChallengeApp.swift
//  DogChallenge
//
//  Created by Naveen Ramachandrappa on 2/3/23.
//

import SwiftUI

@main
struct DogChallengeApp: App {
    var body: some Scene {
        WindowGroup {
			let viewModel = DogListViewModel()
            DogListView(viewModel: viewModel)
        }
    }
}

/*
 Using Dog API (https://dog.ceo/dog-api/documentation/breed), create an app (or Swift Playground) entirely in SwiftUI. The app should have at least basic functionality of seeing dog breeds and being able to see a list of images and/or a random image for a selected breed. We're looking for use of animations, custom alignments, Combine, and/or error handling. Things that give your SwiftUI code a nice touch.
 //Dog API
 //Dog CEO's Dog API Documentation. Over 20,000 images of dogs programmaticaly accessible by over 120 breeds. Image supplied by the Stanford Dogs Dataset.
 }
 */
