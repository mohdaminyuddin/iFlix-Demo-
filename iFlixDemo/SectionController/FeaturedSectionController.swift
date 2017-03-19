//
//  FeaturedSectionController.swift
//  iFlixDemo
//
//  Created by Wahyu Sumartha  on 19/03/2017.
//  Copyright © 2017 Wahyu Sumartha . All rights reserved.
//

import IGListKit
import SDWebImage

class FeaturedSectionController: IGListSectionController {
 
  var movie: Movie?
  
  override init() {
    super.init()
  }

}


extension FeaturedSectionController: IGListSectionType {
  func numberOfItems() -> Int {
    return 1
  }
  
  func sizeForItem(at index: Int) -> CGSize {
    if let width = collectionContext?.containerSize.width {
      return CGSize(width: width, height: 200)
    } else {
      return .zero
    }
  }
  
  func cellForItem(at index: Int) -> UICollectionViewCell {
    let cell = collectionContext?.dequeueReusableCell(withNibName: "FeaturedCollectionViewCell", bundle: nil, for: self, at: index) as! FeaturedCollectionViewCell
    if let posterPath = movie?.posterPath {
      var posterImage = PosterImage()
      posterImage.posterSize = "original"
      cell.imageView.sd_setImage(with: posterImage.getImageUrl(from: posterPath),
                                 completed: nil)
    }
    return cell
  }
  
  func didUpdate(to object: Any) {
    movie = object as? Movie
  }
  
  func didSelectItem(at index: Int) {
    
  }
}
