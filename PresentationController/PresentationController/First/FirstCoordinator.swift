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
    vc.coordinator = self
    self.navigationController.pushViewController(vc, animated: true)
  }
  
  func presentSheet() {
    let coordinator = SheetCoordinator(navigationController: self.navigationController)
    self.start(childCoordinator: coordinator)
  }
}
