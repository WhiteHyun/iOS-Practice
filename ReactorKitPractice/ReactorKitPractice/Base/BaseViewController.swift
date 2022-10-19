//
//  BaseViewController.swift
//  ReactorKitPractice
//
//  Created by 홍승현 on 2022/10/19.
//

import UIKit

import class RxSwift.DisposeBag

class BaseViewController: UIViewController {
  
  private var disposeBag = DisposeBag()
  
  weak var coordinator: Coordinator?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupLayouts()
    setupConstraints()
    setupStyles()
  }
  
  func setupLayouts() { }
  func setupConstraints() { }
  func setupStyles() { }
  
}
