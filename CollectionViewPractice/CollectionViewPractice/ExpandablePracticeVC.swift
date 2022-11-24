//
//  ExpandablePracticeVC.swift
//  CollectionViewPractice
//
//  Created by 홍승현 on 2022/10/19.
//

import UIKit

import SnapKit
import Then

final class ExpandablePracticeVC: UIViewController {
  
  private lazy var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then {
    $0.collectionViewLayout = createLayout()
    $0.backgroundColor = .systemYellow
    $0.dataSource = self
    $0.register(ExpandableCollectionViewCell.self, forCellWithReuseIdentifier: ExpandableCollectionViewCell.id)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    view.addSubview(collectionView)
    
    collectionView.snp.makeConstraints { make in
      make.edges.equalTo(self.view.safeAreaLayoutGuide)
    }
  }
    
  private func createLayout() -> UICollectionViewCompositionalLayout {
    
    // item
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                          heightDimension: .fractionalHeight(1))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)

    // group
    let group = NSCollectionLayoutGroup.horizontal(
      layoutSize: .init(widthDimension: .absolute(70),
                        heightDimension: .absolute(70)),
      subitems: [item]
    )

    // section
    let section = NSCollectionLayoutSection(group: group)
    section.orthogonalScrollingBehavior = .continuous
    section.interGroupSpacing = 10
    section.contentInsets = .init(top: 0, leading: 10, bottom: 30, trailing: 10)
    section.boundarySupplementaryItems = [
      .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                              heightDimension: .estimated(50)),
            elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    ]
    
    return UICollectionViewCompositionalLayout(section: section)
  }
}

extension ExpandablePracticeVC: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 30
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExpandableCollectionViewCell.id, for: indexPath) as? ExpandableCollectionViewCell else {
      fatalError()
    }
    cell.backgroundColor = .systemGray5
    cell.layer.cornerRadius = cell.frame.height / 2
    cell.configure(with: String(indexPath.item))
    return cell
  }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct ExpandablePracticeVCPreview: PreviewProvider {
  static var previews: some View {
    ExpandablePracticeVC().toPreview()
  }
}
#endif
