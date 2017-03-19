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
 
  func testMovieData_FromJSONFile_Should_Return_Correct_Data() {
    if let jsonDictionary = BundleJSONLoader().loadJSON(for: "movie-example") {
      if let movie = Movie(json: jsonDictionary) {
        XCTAssertEqual(movie.title, "The Shawshank Redemption")
        XCTAssertEqual(movie.overview, "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.")
        XCTAssertEqual(movie.movieId, 278)
        XCTAssertEqual(movie.posterPath, "/9O7gLzmreU0nGkIB6K3BsJbzvNv.jpg")
        XCTAssertEqual(movie.voteAverage, 8.4)
      } else {
        XCTFail("Could not bind jsondictionary to movie object")
      }
    } else {
      XCTFail("Could not read json file")
    }
  }
}
