//
//  DogImagesPageObjectModel.swift
//  DogChallengeUITests
//
//  Created by Naveen Ramachandrappa on 7/11/23.
//

import Foundation
import XCTest

class DogImagesPageObjectModel {
    
    var pageIdentifier: String {
        return "DogImages page"
    }
    
    @discardableResult
    func assertDogPicsAreDisplayed() -> DogImagesPageObjectModel {
        if app.scrollViews.element.firstMatch.waitForExistence(timeout: 3) {
            XCTAssertTrue(app.scrollViews.images.count > 0, "Dog images are not present on the page \(pageIdentifier), Failure Function : \(#function)")
        } else {
            XCTFail("Dog images are not dispalyed on the page \(pageIdentifier), Failure Function : \(#function)")
        }
        
        return self
    }
    
    @discardableResult
    func assertDogBreedIsDisplayedInTheTitle(dogName: inout String) -> DogImagesPageObjectModel {
        XCTAssert(app.navigationBars[dogName].staticTexts[dogName].label == dogName, "Dog breed is not dispalyed in the title of the page \(pageIdentifier), Failure Function : \(#function)")
        return self
    }
    
    @discardableResult
    func navigateHome(dogName: String) -> DogListPageObjectModel {
        app.navigationBars[dogName].buttons["Dog Breeds"].tap()
        return DogListPageObjectModel()
    }
    
}
