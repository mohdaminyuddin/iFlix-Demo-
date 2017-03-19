/**
 Copyright (c) 2016-present, Facebook, Inc. All rights reserved.
 
 The examples provided by Facebook are for non-commercial testing and evaluation
 purposes only. Facebook reserves all rights not expressly granted.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 FACEBOOK BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

import IGListKit


class EmbeddedSectionController: IGListSectionController {
  
  var sectionType: String?
  
  var type: HorizontalSectionType?
  
  lazy var adapter: IGListAdapter = {
    let adapter = IGListAdapter(updater: IGListAdapterUpdater(),
                                viewController: self.viewController,
                                workingRangeSize: 0)
    adapter.dataSource = self
    return adapter
  }()
  
  override init() {
    super.init()
    supplementaryViewSource = self
  }
  
}

extension EmbeddedSectionController: IGListSectionType {
  func numberOfItems() -> Int {
    return 1
  }
  
  func sizeForItem(at index: Int) -> CGSize {
    if let width = collectionContext?.containerSize.width {
      return CGSize(width: width, height: 190)
    } else {
      return .zero
    }
  }
  
  func cellForItem(at index: Int) -> UICollectionViewCell {
    let cell = collectionContext?.dequeueReusableCell(of: EmbeddedCollectionViewCell.self,
                                                      for: self,
                                                      at: index) as! EmbeddedCollectionViewCell
    adapter.collectionView = cell.collectionView
    return cell
  }
  
  func didUpdate(to object: Any) {
    sectionType = object as? String
  }
  
  func didSelectItem(at index: Int) {
    
  }
}

extension EmbeddedSectionController: IGListAdapterDataSource {
  func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
    let controller = viewController as? ViewController
    if HorizontalSectionType(rawValue: (sectionType!)) == .trending {
      return controller!.viewModel.trendingMovies as [IGListDiffable]
    } else {
      return controller!.viewModel.popularPeoples as [IGListDiffable]
    }
  }
  
  func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
    if HorizontalSectionType(rawValue: (sectionType)!) == .trending {
      return TrendingSectionController()
    } else {
      return PeopleSectionController()
    }
  }
  
  func emptyView(for listAdapter: IGListAdapter) -> UIView? {
    return nil
  }
}

extension EmbeddedSectionController: IGListSupplementaryViewSource {
  func supportedElementKinds() -> [String] {
    return [UICollectionElementKindSectionHeader]
  }
  
  func viewForSupplementaryElement(ofKind elementKind: String, at index: Int) -> UICollectionReusableView {
    let view = collectionContext?.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader,
                                                                   for: self,
                                                                   nibName: "MovieHeaderView",
                                                                   bundle: nil,
                                                                   at: index) as! MovieHeaderView

    view.headerLabel.text = sectionType
    return view
  }
  
  func sizeForSupplementaryView(ofKind elementKind: String, at index: Int) -> CGSize {
    return CGSize(width: collectionContext!.containerSize.width, height: 40)
  }
}
