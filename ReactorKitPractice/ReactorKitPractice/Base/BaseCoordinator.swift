//
//  BaseCoordinator.swift
//  ReactorKitPractice
//
//  Created by 홍승현 on 2022/10/19.
//

import UIKit

class BaseCoordinator: NSObject, Coordinator {
  var navigationController: UINavigationController
  
  var childCoordinators: [Coordinator] = []
  var parentCoordinator: Coordinator?
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    fatalError("start method must be implemented")
  }
}
