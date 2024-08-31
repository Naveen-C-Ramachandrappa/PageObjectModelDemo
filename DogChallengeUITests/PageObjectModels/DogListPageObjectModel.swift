//
//  DogListPageObjectModel.swift
//  DogChallengeUITests
//
//  Created by Naveen Ramachandrappa on 7/11/23.
//

import Foundation
import XCTest

class DogListPageObjectModel {
    
    var elemetsQuery : XCUIElementQuery  {
        return app.scrollViews.otherElements
    }
    
    func assertDogListIsDisplayed() {
        XCTAssert(elemetsQuery.buttons.count > 0)
    }
    
    func tapOnARandomDog(randomDogName: inout String) -> DogImagesPageObjectModel {
        if elemetsQuery.buttons.count > 0 {
            let dogBreedCountEndIndex = elemetsQuery.buttons.count - 1
            let randomInt = Int.random(in: 0..<dogBreedCountEndIndex)
            randomDogName = app.scrollViews.otherElements.buttons.element(boundBy: randomInt).label
            elemetsQuery.buttons[randomDogName].tap()
        } else {
            XCTFail("Dog breeds are not present")
        }
        
        return DogImagesPageObjectModel()
    }
}
