//
//  SheetCoordinator.swift
//  PresentationController
//
//  Created by 홍승현 on 2022/11/24.
//

import UIKit

final class SheetCoordinator: BaseCoordinator {
  
  override func start() {
    let nextVC = SheetViewController()
    nextVC.coordinator = self
    self.navigationController.viewControllers.last?.present(nextVC, animated: true)
  }
  
  func moveToNewVC(_ viewController: UIViewController) {
    viewController.dismiss(animated: false)
    let coordinator = ThirdCoordinator(navigationController: self.navigationController)
    self.start(childCoordinator: coordinator)
  }
}
