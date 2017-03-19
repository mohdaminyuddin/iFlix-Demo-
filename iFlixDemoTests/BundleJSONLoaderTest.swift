//
//  BundleJSONLoaderTest.swift
//  iFlixDemo
//
//  Created by Wahyu Sumartha  on 19/03/2017.
//  Copyright © 2017 Wahyu Sumartha . All rights reserved.
//

import XCTest
@testable import iFlixDemo

class BundleJSONLoaderTest: XCTestCase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testLoadJSONFromBundle_Should_Not_Be_Nil() {
    let jsonLoader = BundleJSONLoader()
    XCTAssertNotNil(jsonLoader.loadJSON(for: "movie-example"))
  }
  
  func testLoadJSONFromBundle_Should_Be_Nil() {
    let jsonLoader = BundleJSONLoader()
    XCTAssertNil(jsonLoader.loadJSON(for: "movies-example"))
  }
  
  func testLoadJSONFromBundle_When_FileName_Empty_Should_Return_Nil() {
    let jsonLoader = BundleJSONLoader()
    XCTAssertNil(jsonLoader.loadJSON(for: ""))
  }
  
  func testLoadJSONFromBundle_Should_Return_Correct_Data() {
    let jsonLoader = BundleJSONLoader()
    let jsonDictionary = jsonLoader.loadJSON(for: "movie-example")
    XCTAssertEqual(jsonDictionary?["original_title"] as! String, "The Shawshank Redemption")
  }
}
