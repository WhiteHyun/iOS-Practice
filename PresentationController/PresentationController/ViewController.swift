//
//  ViewController.swift
//  PresentationController
//
//  Created by 홍승현 on 2022/11/24.
//

import UIKit

import SnapKit
import Then

final class ViewController: UIViewController {
  
  private lazy var button = UIButton(
    configuration: .tinted(),
    primaryAction: .init(handler: { _ in
      let nextVC = SheetViewController()
      self.present(nextVC, animated: true)
    })
  )
    .then {
      $0.setTitle("Present Sheet", for: .normal)
      $0.configuration?.cornerStyle = .capsule
    }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupLayouts()
    setupConstraints()
    setupStyles()
  }
  
  private func setupLayouts() {
    view.addSubview(button)
  }
  
  private func setupConstraints() {
    button.snp.makeConstraints { make in
      make.center.equalToSuperview()
      make.width.equalTo(200)
      make.height.equalTo(45)
    }
  }
  
  private func setupStyles() {
    view.backgroundColor = .systemBackground
  }
}
