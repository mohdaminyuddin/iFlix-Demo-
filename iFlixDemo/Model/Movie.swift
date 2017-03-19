//
//  Movie.swift
//  iFlixDemo
//
//  Created by Wahyu Sumartha  on 19/03/2017.
//  Copyright © 2017 Wahyu Sumartha . All rights reserved.
//
import Gloss

struct Movie: Diffable, Decodable {
  let movieId: Int
  var title: String = ""
  var voteAverage: Double = 0.0
  var language: String = ""
  var overview: String = ""
  var posterPath: String = ""
 
  init?(json: JSON) {
    guard let movieId: Int = "id" <~~ json else {
      return nil
    }
    
    self.movieId = movieId
    
    if let title: String = "original_title" <~~ json {
      self.title = title
    }
    
    if let voteAverage: Double = "vote_average" <~~ json {
      self.voteAverage = voteAverage
    }
    
    if let language: String = "original_language" <~~ json {
      self.language = language
    }
    
    if let overview: String = "overview" <~~ json {
      self.overview = overview
    }
    
    if let posterPath: String = "poster_path" <~~ json {
      self.posterPath = posterPath
    }

  }
  
  var diffIdentifier: String {
    return "\(movieId)"
  }
  
  static func ==(lhs: Movie, rhs: Movie) -> Bool {
    return lhs.movieId == rhs.movieId &&
      lhs.title == rhs.title &&
      lhs.voteAverage == rhs.voteAverage &&
      lhs.language == rhs.language &&
      lhs.overview == rhs.overview &&
      lhs.posterPath == rhs.posterPath
  }
}
