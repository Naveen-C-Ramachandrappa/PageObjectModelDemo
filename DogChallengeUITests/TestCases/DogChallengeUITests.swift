//
//  DogChallengeUITests.swift
//  DogChallengeUITests
//
//  Created by Naveen Ramachandrappa on 6/26/23.
//

import XCTest

class DogChallengeUITests: UITestBase {
  
  // Verify list of dog breeds displays on app load
  func test1() {
    // Test code
      HomePage()
      .assertDogListIsDisplayed()
  }
  
  // Tap a random breed. Verify one or more pictures load and the selected dog breed is displayed in the title
  func test2() {
    // Test code
      var randomDogName = ""
      HomePage()
      .tapOnARandomDog(randomDogName: &randomDogName)
      .assertDogBreedIsDisplayedInTheTitle(dogName: &randomDogName)
      .assertDogPicsAreDisplayed()
  }
  
  // For 5 random breeds - Verify none have zero pictures and the correct title is loaded
   
  func test3() {
      var randomDogName = ""
      for _ in 1...5 {
          randomDogName = ""
          HomePage()
          .tapOnARandomDog(randomDogName: &randomDogName)
          .assertDogBreedIsDisplayedInTheTitle(dogName: &randomDogName)
          .assertDogPicsAreDisplayed()
          .navigateHome(dogName: randomDogName)
      }
  }
  
  /**
   BONUS
  
   Create reusable objects/functions
   */
}
