//
//  Config.swift
//  iFlixDemo
//
//  Created by Wahyu Sumartha  on 19/03/2017.
//  Copyright © 2017 Wahyu Sumartha . All rights reserved.
//
import Foundation

protocol ImageUrlType {
  var baseUrl: String { get }
  var posterSize: String { get }
}

struct PosterImage: ImageUrlType {
  var baseUrl: String = "https://image.tmdb.org/t/p/"
  var posterSize: String = "w185"
  
  func getImageUrl(from posterPath: String) -> URL? {
    return posterPath.isEmpty ? nil : URL(string: "\(baseUrl)\(posterSize)\(posterPath)")
  }
}
