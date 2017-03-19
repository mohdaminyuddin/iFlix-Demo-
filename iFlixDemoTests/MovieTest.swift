//
//  MovieTest.swift
//  iFlixDemo
//
//  Created by Wahyu Sumartha  on 19/03/2017.
//  Copyright © 2017 Wahyu Sumartha . All rights reserved.
//

import XCTest
@testable import iFlixDemo

class MovieTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
  func testMovieInitialization_With_EmptyJSON() {
    let movie = Movie(json: [String: Any]()) // empty object
    XCTAssertNil(movie)
  }
  
  
}
