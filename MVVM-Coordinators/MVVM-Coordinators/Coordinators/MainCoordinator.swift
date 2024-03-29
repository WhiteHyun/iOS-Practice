//
//  MainCoordinator.swift
//  MVVM-Coordinators
//
//  Created by 홍승현 on 2022/06/24.
//

import UIKit

class MainCoordinator: NSObject, Coordinator {
  
  var childCoordinators: [Coordinator] = []
  var navigationController: UINavigationController
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    navigationController.delegate = self
    
    let vc = ViewController()
    vc.coordinator = self
    navigationController.pushViewController(vc, animated: false)
  }
  
  
  func buySubscription(to productType: Int) {
    let child = BuyCoordinator(navigationController: navigationController)
    
    child.parentCoordinator = self
    childCoordinators.append(child)
    child.start()
  }
  
  func createAccount() {
    let vc = CreateAccountViewController()
    vc.coordinator = self
    navigationController.pushViewController(vc, animated: true)
  }
  
  func childDidFinish(_ child: Coordinator?) {
    for (index, coordinator) in childCoordinators.enumerated() {
      if coordinator === child {
        childCoordinators.remove(at: index)
        break
      }
    }
  }
}

extension MainCoordinator: UINavigationControllerDelegate {
  func navigationController(
    _ navigationController: UINavigationController,
    didShow viewController: UIViewController,
    animated: Bool
  ) {
    
    guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
      return
    }
    
    if navigationController.viewControllers.contains(fromViewController) {
      return
    }
    
    if let buyViewController = fromViewController as? BuyViewController {
      childDidFinish(buyViewController.coordinator)
    }
  }
}
