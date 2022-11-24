//
//  ThirdViewController.swift
//  PresentationController
//
//  Created by 홍승현 on 2022/11/24.
//

import UIKit

import SnapKit
import Then

final class ThirdViewController: UIViewController {
  
  private let label = UILabel().then {
    $0.text = "Third View Controller"
    $0.numberOfLines = 0
    $0.textAlignment = .center
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupLayouts()
    setupConstraints()
    setupStyles()
  }
  
  private func setupLayouts() {
    view.addSubview(label)
  }
  
  private func setupConstraints() {
    label.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(20)
      make.horizontalEdges.equalToSuperview().inset(40)
    }
  }
  
  private func setupStyles() {
    view.backgroundColor = .systemBackground
  }
}
