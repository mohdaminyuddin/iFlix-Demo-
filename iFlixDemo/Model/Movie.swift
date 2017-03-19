//
//  Movie.swift
//  iFlixDemo
//
//  Created by Wahyu Sumartha  on 19/03/2017.
//  Copyright © 2017 Wahyu Sumartha . All rights reserved.
//
import Gloss
import IGListKit

final class Movie: IGListDiffable, Decodable {
  let movieId: Int
  var title: String = ""
  var voteAverage: Double = 0.0
  var language: String = ""
  var overview: String = ""
  var posterPath: String = ""
  var isFeatured: Bool = false 
  
  required init?(json: JSON) {
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
  
  func diffIdentifier() -> NSObjectProtocol {
    return movieId as NSObjectProtocol
  }
  
  func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? Movie else { return false }
    return movieId == object.movieId &&
      title == object.title &&
      voteAverage == object.voteAverage &&
      language == object.language &&
      overview == object.overview &&
      posterPath == object.posterPath
 
  }
}
