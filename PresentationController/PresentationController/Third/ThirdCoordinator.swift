//
//  ThirdCoordinator.swift
//  PresentationController
//
//  Created by 홍승현 on 2022/11/24.
//

import UIKit

final class ThirdCoordinator: BaseCoordinator {
  
  override func start() {
    let vc = ThirdViewController()
    vc.modalPresentationStyle = .overCurrentContext
    self.navigationController.viewControllers.last?.present(vc, animated: true)
  }
}
