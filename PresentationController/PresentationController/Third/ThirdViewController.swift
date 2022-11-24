//
//  ThirdViewController.swift
//  PresentationController
//
//  Created by 홍승현 on 2022/11/24.
//

import UIKit

import SnapKit
import Then

final class ThirdViewController: BaseViewController {
  
  private let label = UILabel().then {
    $0.text = "Third View Controller"
    $0.numberOfLines = 0
    $0.textAlignment = .center
  }
  
  override func setupLayouts() {
    super.setupLayouts()
    view.addSubview(label)
  }
  
  override func setupConstraints() {
    super.setupConstraints()
    label.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(20)
      make.horizontalEdges.equalToSuperview().inset(40)
    }
  }
  
  override func setupStyles() {
    super.setupStyles()
  }
}
