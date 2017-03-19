//
//  ViewController.swift
//  iFlixDemo
//
//  Created by Wahyu Sumartha  on 19/03/2017.
//  Copyright © 2017 Wahyu Sumartha . All rights reserved.
//

import IGListKit

enum HorizontalSectionType: String {
  case trending = "Trending"
  case popularPeoples = "Popular Peoples"
}

class ViewController: UIViewController {

  let collectionView: IGListCollectionView = {
    let view = IGListCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    view.backgroundColor = UIColor(red: 15/255, green: 10/255, blue: 3/255, alpha: 1.0)
    return view
  }()
 
  lazy var adapter: IGListAdapter = {
    return IGListAdapter(updater: IGListAdapterUpdater(), viewController: self, workingRangeSize: 0)
  }()

  let viewModel = ViewControllerViewModel()
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    title = "iFlix Demo"
    
    view.addSubview(collectionView)
    
    adapter.collectionView = collectionView
    adapter.dataSource = self
    
    adapter.reloadData(completion: nil)
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    collectionView.frame = view.bounds
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}

//MARK: IGListAdapterDataSource 
extension ViewController: IGListAdapterDataSource {
  func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
    var items: [IGListDiffable] = [viewModel.featuredMovie!]
    items += [HorizontalSectionType.trending.rawValue as IGListDiffable] as [IGListDiffable]
    items += [HorizontalSectionType.popularPeoples.rawValue as IGListDiffable] as [IGListDiffable]
    return items
   }
  
  func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
    if object is Movie {
        return FeaturedSectionController()
    } else if object is String {
        return EmbeddedSectionController()
    } else {
      return IGListSectionController()
    }
  }
  
  func emptyView(for listAdapter: IGListAdapter) -> UIView? {
    return nil
  }
  
}

