//
//  TrendingSectionController.swift
//  iFlixDemo
//
//  Created by Wahyu Sumartha  on 19/03/2017.
//  Copyright © 2017 Wahyu Sumartha . All rights reserved.
//

import IGListKit

class TrendingSectionController: IGListSectionController {

  var movie: Movie?

  override init() {
    super.init()
    inset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
  }
  
}

extension TrendingSectionController: IGListSectionType {
  func numberOfItems() -> Int {
    return 1
  }

  func sizeForItem(at index: Int) -> CGSize {
    return CGSize(width: 150, height: 190)
  }
  
  func cellForItem(at index: Int) -> UICollectionViewCell {
    let cell = collectionContext?.dequeueReusableCell(withNibName: "MovieCollectionViewCell", bundle: nil, for: self, at: index) as! MovieCollectionViewCell
    var posterImage = PosterImage()
    posterImage.posterSize = "w300"
    cell.imageView.sd_setImage(with: posterImage.getImageUrl(from: (movie?.posterPath)!),
                               completed: nil)
    return cell
  }
  
  func didUpdate(to object: Any) {
    movie = object as? Movie
  }
  
  func didSelectItem(at index: Int) {
    
  }
}


