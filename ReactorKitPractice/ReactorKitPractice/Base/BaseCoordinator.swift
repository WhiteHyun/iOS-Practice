//
//  BaseCoordinator.swift
//  ReactorKitPractice
//
//  Created by νμΉν on 2022/10/19.
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
