//
//  ExpandableCollectionViewCell.swift
//  CollectionViewPractice
//
//  Created by 홍승현 on 2022/10/19.
//

import UIKit

final class ExpandableCollectionViewCell: UICollectionViewCell {
  
  static let id = "ExpandableCollectionViewCell"
  
  let textLabel: UILabel = UILabel().then {
    $0.textAlignment = .center
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    contentView.addSubview(textLabel)
    
    textLabel.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(with text: String) {
    textLabel.text = text
  }
}
