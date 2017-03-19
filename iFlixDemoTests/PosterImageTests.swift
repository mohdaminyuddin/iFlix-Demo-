//
//  PosterImageTest.swift
//  iFlixDemo
//
//  Created by Wahyu Sumartha  on 19/03/2017.
//  Copyright © 2017 Wahyu Sumartha . All rights reserved.
//

import XCTest
@testable import iFlixDemo

class PosterImageTest: XCTestCase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testPosterImage_Should_Not_Be_Nil() {
    let posterImage = PosterImage()
    XCTAssertNotNil(posterImage)
  }
  
  func testPosterImage_Should_Return_Correct_URL() {
    let posterImage = PosterImage()
    XCTAssertEqual(posterImage.getImageUrl(from: "/gf3DxP79Smp98KD6UNDsVb6GDeW.jpg")?.absoluteString,
                   URL(string: "https://image.tmdb.org/t/p/w185/gf3DxP79Smp98KD6UNDsVb6GDeW.jpg")?.absoluteString)
  }
 
  func testPosterImage_URL_Should_Not_Be_Nil() {
    let posterImage = PosterImage()
    XCTAssertNotNil(posterImage.getImageUrl(from: "gf3DxP79Smp98KD6UNDsVb6GDeW.jpg"))
  }
  
  func testPosterImage_URL_Should_Be_Nil() {
    let posterImage = PosterImage()
    XCTAssertNil(posterImage.getImageUrl(from: ""))
  }

}
