//
//  ViewController.swift
//  BaseViewController
//
//  Created by 홍승현 on 2022/09/23.
//

import UIKit

import RxCocoa

final class ViewController: BaseViewController {

  let button: UIButton = {
    let button = UIButton()
    button.backgroundColor = .lightGray
    button.setTitle("Tap me!", for: .normal)
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func setupLayouts() {
    super.setupLayouts()
    view.addSubview(button)
  }
  
  override func setupConstraints() {
    super.setupConstraints()
    button.frame = view.bounds
  }
  
  override func setupStyles() {
    super.setupStyles()
    view.backgroundColor = .systemBackground
  }
  
  override func bind() {
    super.bind()
    button.rx.tap
      .subscribe(onNext: {
        print("Tapped!")
      })
      .disposed(by: disposeBag)
  }
}
