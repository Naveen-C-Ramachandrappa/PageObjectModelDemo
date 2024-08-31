//
//  UITestBase.swift
//  DogChallengeUITests
//
//  Created by Naveen Ramachandrappa on 7/11/23.
//

import Foundation
import XCTest


class UITestBase: XCTestCase  {
    
    func HomePage() -> DogListPageObjectModel {
        return DogListPageObjectModel()
    }
    
    override func setUp() {
        super.setUp()
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
        app.terminate()
    }
    
}
