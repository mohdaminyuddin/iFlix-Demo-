//
//  People.swift
//  iFlixDemo
//
//  Created by Wahyu Sumartha  on 19/03/2017.
//  Copyright © 2017 Wahyu Sumartha . All rights reserved.
//

import Gloss
import IGListKit

final class People: IGListDiffable, Decodable {
  
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
  
  func diffIdentifier() -> NSObjectProtocol {
    return profileId as NSObjectProtocol
  }
  
  func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? People else { return false }
    return profileId == object.profileId &&
      profilePath == object.profilePath &&
      name == object.name &&
      popularity == object.popularity
  }
  
}
