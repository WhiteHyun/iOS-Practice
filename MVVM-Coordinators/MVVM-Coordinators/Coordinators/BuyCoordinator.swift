//
//  BuyCoordinator.swift
//  MVVM-Coordinators
//
//  Created by 홍승현 on 2022/06/24.
//

import UIKit

class BuyCoordinator: Coordinator {
  
  weak var parentCoordinator: MainCoordinator?
  var childCoordinators = [Coordinator]()
  var navigationController: UINavigationController
  
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  
  func start() {
    let vc = BuyViewController()
    vc.coordinator = self 
    navigationController.pushViewController(vc, animated: true)
  }
  
//  func didFinishBuying() {
//    parentCoordinator?.childDidFinish(self)
//  }
}
