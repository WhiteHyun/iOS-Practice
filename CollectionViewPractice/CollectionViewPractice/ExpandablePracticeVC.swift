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
    let layout = UICollectionViewCompositionalLayout.list(using: .init(appearance: .insetGrouped))
    $0.collectionViewLayout = layout
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
}

extension ExpandablePracticeVC: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 30
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExpandableCollectionViewCell.id, for: indexPath) as? ExpandableCollectionViewCell else {
      fatalError()
    }
    cell.backgroundColor = .link
    cell.configure(with: String(indexPath.item))
    return cell
  }
}
