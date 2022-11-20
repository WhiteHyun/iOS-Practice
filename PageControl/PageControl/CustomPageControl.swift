//
//  CustomPageControl.swift
//  PageControl
//
//  Created by 홍승현 on 2022/11/19.
//

import UIKit

import SnapKit
import Then

final class CustomPageControl: UIControl {
  
  private let stackView: UIStackView = .init().then {
    $0.spacing = 8
    $0.distribution = .equalSpacing
    $0.alignment = .center
  }
  
  private var dots: [UIView] = []
  
  var numberOfPages: Int = 0 {
    didSet {
      setupDots()
    }
  }
  
  var currentPage: Int = 0 {
    didSet {
      updateDotsConstraints(animated: true)
      updateDotsStyles(animated: true)
    }
  }
  
  var pageIndicatorTintColor: UIColor? = .white.withAlphaComponent(0.5) {
    didSet {
      updateDotsStyles(animated: false)
    }
  }
  var currentPageIndicatorTintColor: UIColor? = .white {
    didSet {
      updateDotsStyles(animated: false)
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupLayouts()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupLayouts() {
    self.addSubview(stackView)
  }
  
  private func setupConstraints() {
    stackView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
  
  private func setupDots() {
    dots.forEach { $0.removeFromSuperview() }
    dots.removeAll()
      for index in 0..<numberOfPages {
        let dot = UIView()
        stackView.addArrangedSubview(dot)
        dots.append(dot)
        
        // constraints
        dot.snp.makeConstraints { make in
          if index == currentPage {
            make.width.equalTo(40)
          } else {
            make.width.equalTo(10)
          }
          make.height.equalTo(8)
        }
        
        // == dot appearence ==
        dot.clipsToBounds = false
        dot.layer.cornerRadius = 4
      }
  }
  
  private func updateDotsConstraints(animated flag: Bool) {
    for (index, dot) in dots.enumerated() {
      dot.snp.updateConstraints { make in
        if index == currentPage {
          make.width.equalTo(40)
        } else {
          make.width.equalTo(10)
        }
      }
    }
  }
  
  private func updateDotsStyles(animated flag: Bool) {
    for (index, dot) in dots.enumerated() {
      dot.backgroundColor = index == currentPage ? currentPageIndicatorTintColor : pageIndicatorTintColor
    }
    if flag {
      UIView.animate(withDuration: 0.5) {
        self.layoutIfNeeded()
      }
    }
  }
}
