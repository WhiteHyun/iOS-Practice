//
//  FlowLayoutPracticeVC.swift
//  CollectionViewPractice
//
//  Created by 홍승현 on 2022/10/05.
//

import UIKit

final class FlowLayoutPracticeVC: UIViewController {
  
  private lazy var button: UIButton = {
    let button = UIButton(type: .system)
    button.backgroundColor = .systemCyan
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Tap me!", for: .normal)
    button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
    return button
  }()
  
  private lazy var collectionView: UICollectionView = {
    let flowLayout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.backgroundColor = .systemYellow
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(FlowLayoutPracticeCell.self, forCellWithReuseIdentifier: FlowLayoutPracticeCell.id)
    
    return collectionView
  }()
  
  

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    view.addSubview(button)
    view.addSubview(collectionView)
    NSLayoutConstraint.activate(
      [
        button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
        button.heightAnchor.constraint(equalToConstant: 40),
        button.widthAnchor.constraint(equalToConstant: 100),
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        collectionView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 5),
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
      ]
    )
  }
  
  @objc private func buttonDidTap() {
    print(#function)
    collectionView.collectionViewLayout.invalidateLayout()
    // collectionView.reloadData()
  }
}

extension FlowLayoutPracticeVC: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 30
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlowLayoutPracticeCell.id, for: indexPath) as? FlowLayoutPracticeCell else {
      fatalError()
    }
    cell.backgroundColor = .link
    cell.configure(with: String(indexPath.item))
    return cell
  }
}

extension FlowLayoutPracticeVC: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 10 * Int.random(in: 5...10), height: 10 * Int.random(in: 5...10))
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 20
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 80
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
}
