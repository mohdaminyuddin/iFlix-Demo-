//
//  ViewControllerViewModel.swift
//  iFlixDemo
//
//  Created by Wahyu Sumartha  on 19/03/2017.
//  Copyright © 2017 Wahyu Sumartha . All rights reserved.
//


class ViewControllerViewModel {

  var data: [Any] = []
  var featuredMovie: Movie?
  var trendingMovies: [Movie] = []
  var popularPeoples: [People] = []
  var continueWatchMovies: [Movie] = []
  
  init() {
    loadDataFromJSONBundle()
  }
  
  func loadDataFromJSONBundle() {
    let bundleLoader = BundleJSONLoader()
    // insert featured data
    if let featuredJSONDict = bundleLoader.loadJSON(for: "Featured") {
      let featuredMovie = Movie(json: featuredJSONDict)
      featuredMovie?.isFeatured = true
      if let movie = featuredMovie {
        self.featuredMovie = movie
      }
    }
    
    // insert trending data 
    if let trendingJSONDict = bundleLoader.loadJSON(for: "TopRatedMovie") {
      if let trendingJSONResult = trendingJSONDict["results"] as? [[String: Any]] {
        for movieDict in trendingJSONResult {
          if let movie = Movie(json: movieDict) {
            trendingMovies.append(movie)
          }
        }
      }
    }
    
    // insert people data 
    if let peoplesJSONDict = bundleLoader.loadJSON(for: "PopularPeople") {
      if let peopleJSONResult = peoplesJSONDict["results"] as? [[String: Any]] {
        for peopleDict in peopleJSONResult {
          if let people = People(json: peopleDict) {
            popularPeoples.append(people)
          }
        }
      }
    }
    
    // insert continue watch data 
    if let continueWatchJSON = bundleLoader.loadJSON(for: "ContinueWatching") {
      if let continueWatchJSONResult = continueWatchJSON["results"] as? [[String: Any]] {
        for continueWatchDict in continueWatchJSONResult {
          if let movie = Movie(json: continueWatchDict) {
            continueWatchMovies.append(movie)
          }
        }
      }
    }
  }
}
