//
//  PeopleSectionController.swift
//  iFlixDemo
//
//  Created by Wahyu Sumartha  on 19/03/2017.
//  Copyright © 2017 Wahyu Sumartha . All rights reserved.
//

import IGListKit

class PeopleSectionController: IGListSectionController {

  var people: People?
  
  override init() {
    super.init()
    inset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
  }

}

extension PeopleSectionController: IGListSectionType {
  func numberOfItems() -> Int {
    return 1
  }
  
  func sizeForItem(at index: Int) -> CGSize {
    return CGSize(width: 150, height: 190)
  }
  
  func cellForItem(at index: Int) -> UICollectionViewCell {
    let cell = collectionContext?.dequeueReusableCell(withNibName: "PeopleCollectionViewCell", bundle: nil, for: self, at: index) as! PeopleCollectionViewCell
    var posterImage = PosterImage()
    posterImage.posterSize = "w300"
    cell.peopleImageView.sd_setImage(with: posterImage.getImageUrl(from: (people?.profilePath)!),
                               completed: nil)
    cell.nameLabel.text = people?.name
    return cell
  }
  
  func didUpdate(to object: Any) {
    people = object as? People
  }
  
  func didSelectItem(at index: Int) {
    
  }
}

