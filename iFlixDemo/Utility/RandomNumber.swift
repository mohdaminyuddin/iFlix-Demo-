//
//  RandomNumber.swift
//  iFlixDemo
//
//  Created by Wahyu Sumartha  on 19/03/2017.
//  Copyright © 2017 Wahyu Sumartha . All rights reserved.
//

import Foundation

public extension Float {
  /// SwiftRandom extension
  public static func random(lower: Float = 0, _ upper: Float = 100) -> Float {
    return (Float(arc4random()) / 0xFFFFFFFF) * (upper - lower) + lower
  }
}
