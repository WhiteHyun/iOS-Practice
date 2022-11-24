//
//  SheetViewController.swift
//  PresentationController
//
//  Created by 홍승현 on 2022/11/24.
//

import UIKit

final class SheetViewController: UIViewController {
  
  private let label = UILabel().then {
    $0.text = "This is Bottom Sheet View"
    $0.numberOfLines = 0
    $0.textAlignment = .center
  }
  
  private lazy var descriptionLabel = UILabel().then {
    $0.text = "\(sheetPresentationController?.selectedDetentIdentifier)"
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
    view.addSubview(descriptionLabel)
  }
  
  private func setupConstraints() {
    label.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(20)
      make.horizontalEdges.equalToSuperview().inset(40)
    }
    
    descriptionLabel.snp.makeConstraints { make in
      make.center.equalToSuperview()
      make.horizontalEdges.equalToSuperview()
    }
  }
  
  private func setupStyles() {
    view.backgroundColor = .systemBackground
    sheetPresentationController?.delegate = self
    sheetPresentationController?.selectedDetentIdentifier = .medium
    sheetPresentationController?.prefersGrabberVisible = true
    sheetPresentationController?.detents = [.medium(), .large()]
  }
  
}


extension SheetViewController: UISheetPresentationControllerDelegate {
  func sheetPresentationControllerDidChangeSelectedDetentIdentifier(_ sheetPresentationController: UISheetPresentationController) {
    descriptionLabel.text = "\(sheetPresentationController.selectedDetentIdentifier!.rawValue)"
  }
}
