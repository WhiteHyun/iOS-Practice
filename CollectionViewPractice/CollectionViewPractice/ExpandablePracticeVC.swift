//
//  ExpandablePracticeVC.swift
//  CollectionViewPractice
//
//  Created by 홍승현 on 2022/10/19.
//

import UIKit
final class ExpandablePracticeVC: UIViewController {
  
  private lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewCompositionalLayout.list(using: .init(appearance: .insetGrouped))
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.backgroundColor = .systemYellow
    collectionView.dataSource = self
    collectionView.register(ExpandableCollectionViewCell.self, forCellWithReuseIdentifier: ExpandableCollectionViewCell.id)
    
    return collectionView
  }()
  
  

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    view.addSubview(collectionView)
    NSLayoutConstraint.activate(
      [
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
      ]
    )
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
