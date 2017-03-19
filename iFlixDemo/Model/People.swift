//
//  People.swift
//  iFlixDemo
//
//  Created by Wahyu Sumartha  on 19/03/2017.
//  Copyright © 2017 Wahyu Sumartha . All rights reserved.
//

import Gloss

struct People: Diffable, Decodable {
  
  let profileId: Int
  var profilePath: String = ""
  var name: String = ""
  var popularity: Double = 0.0
 
  init?(json: JSON) {
    guard let profileId: Int = "id" <~~ json else { return nil }
    self.profileId = profileId
    
    if let profilePath: String = "profile_path" <~~ json {
      self.profilePath = profilePath
    }
    
    if let name: String = "name" <~~ json {
      self.name = name
    }
    
    if let popularity: Double = "popularity" <~~ json {
      self.popularity = popularity
    }
  }
  
  var diffIdentifier: String {
    return "\(profileId)"
  }
  
  static func ==(lhs: People, rhs: People) -> Bool {
    return lhs.profileId == rhs.profileId &&
      lhs.profilePath == rhs.profilePath &&
      lhs.name == rhs.name &&
      lhs.popularity == rhs.popularity
  }
  
}
