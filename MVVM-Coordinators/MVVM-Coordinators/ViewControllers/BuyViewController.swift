//
//  BuyViewController.swift
//  MVVM-Coordinators
//
//  Created by 홍승현 on 2022/06/24.
//

import UIKit

class BuyViewController: UIViewController {
  
  weak var coordinator: BuyCoordinator?
  var selectedProduct = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemGreen
  }
  
//  override func viewDidDisappear(_ animated: Bool) {
//    super.viewDidDisappear(animated)
//    coordinator?.didFinishBuying()
//  }
}
