//
//  BundleJSONLoader.swift
//  iFlixDemo
//
//  Created by Wahyu Sumartha  on 19/03/2017.
//  Copyright © 2017 Wahyu Sumartha . All rights reserved.
//

import Foundation

class BundleJSONLoader {
  
  func loadJSON(for fileName: String) -> [String: Any]? {
    if fileName.isEmpty {
      return nil
    } else {
      guard let path = Bundle(for: type(of: self))
        .path(forResource: fileName, ofType: "json") else { return nil }
      guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else { return nil }
      let json = try? JSONSerialization.jsonObject(with: data, options: [])
      return json as? [String: Any]
    }
  }
  
}
