//
//  FirstCoordinator.swift
//  PresentationController
//
//  Created by 홍승현 on 2022/11/24.
//

import UIKit

final class FirstCoordinator: BaseCoordinator {
  
  override func start() {
    let vc = ViewController()
    self.navigationController.pushViewController(vc, animated: true)
  }
}
