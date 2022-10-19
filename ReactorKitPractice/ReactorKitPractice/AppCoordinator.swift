//
//  AppCoordinator.swift
//  ReactorKitPractice
//
//  Created by 홍승현 on 2022/10/19.
//

import UIKit


final class AppCoordinator: BaseCoordinator {
  
  override func start() {
    self.navigationController.delegate = self
    let coordinator = FirstCoordinator(navigationController: self.navigationController)
    start(coordinator: coordinator)
  }
  

}
extension AppCoordinator: UINavigationControllerDelegate {
  
  func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
    
    print(navigationController.transitionCoordinator?.viewController(forKey: .to), "To")
    print(navigationController.transitionCoordinator?.viewController(forKey: .from), "From")
    guard let vc = navigationController.transitionCoordinator?.viewController(forKey: .from) as? BaseViewController,
          let coordinator = vc.coordinator,
          !navigationController.viewControllers.contains(vc)
    else { return }
    
    
    assert(coordinator.parentCoordinator != nil)
    coordinator.parentCoordinator?.finish(coordinator: coordinator)
  }
}
