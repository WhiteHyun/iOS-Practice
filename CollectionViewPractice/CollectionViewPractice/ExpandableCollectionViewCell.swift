//
//  ExpandableCollectionViewCell.swift
//  CollectionViewPractice
//
//  Created by 홍승현 on 2022/10/19.
//

import UIKit

final class ExpandableCollectionViewCell: UICollectionViewCell {
  
  static let id = "ExpandableCollectionViewCell"
  
  let textLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    contentView.addSubview(textLabel)
    
    
    textLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(with text: String) {
    textLabel.text = text
  }
}
