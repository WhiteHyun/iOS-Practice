//
//  ViewController.swift
//  PresentationController
//
//  Created by 홍승현 on 2022/11/24.
//

import UIKit

import SnapKit
import Then

final class ViewController: BaseViewController {
  
  private let label = UILabel().then {
    $0.text = "This is Root View"
    $0.numberOfLines = 0
    $0.textAlignment = .center
  }
  
  private lazy var button = UIButton(
    configuration: .tinted(),
    primaryAction: .init(handler: { _ in
      guard let coordinator = self.coordinator as? FirstCoordinator else { return }
      coordinator.presentSheet()
    })
  )
    .then {
      $0.setTitle("Present Sheet", for: .normal)
      $0.configuration?.cornerStyle = .capsule
    }
  
  override func setupLayouts() {
    super.setupLayouts()
    view.addSubview(button)
    view.addSubview(label)
  }
  
  override func setupConstraints() {
    super.setupConstraints()
    button.snp.makeConstraints { make in
      make.center.equalToSuperview()
      make.width.equalTo(200)
      make.height.equalTo(45)
    }
    
    label.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(20)
      make.horizontalEdges.equalToSuperview().inset(40)
    }
  }
  
  override func setupStyles() {
    super.setupStyles()
    view.backgroundColor = .systemCyan
  }
}
