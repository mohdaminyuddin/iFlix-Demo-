//
//  PeopleTests.swift
//  iFlixDemo
//
//  Created by Wahyu Sumartha  on 19/03/2017.
//  Copyright © 2017 Wahyu Sumartha . All rights reserved.
//

import XCTest
@testable import iFlixDemo

class PeopleTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testPeopleInitializer_Should_Be_Nil() {
    let people = People(json: [String: Any]())
    XCTAssertNil(people)
  }
  
  func testPeople_FromJSON_Should_Return_Correct_Data() {
    if let jsonDict = BundleJSONLoader().loadJSON(for: "PopularPeople") {
      if let peopleJSONDict = jsonDict["results"] as? [[String: Any]] {
        if let firstPeople = peopleJSONDict.first {
          if let people = People(json: firstPeople) {
            XCTAssertEqual(people.profileId, 14386)
            XCTAssertEqual(people.profilePath, "/mDDpeDtxuL9Af59rOB8DAjni50A.jpg")
            XCTAssertEqual(people.name, "Beyoncé Knowles")
            XCTAssertEqual(people.popularity, 103.475293)
          } else {
            XCTFail()
          }
        } else {
          XCTFail()
        }
      } else {
        XCTFail("Could not get people json dictionary")
      }
    } else {
      XCTFail("Could not load json data")
    }
  }
}
