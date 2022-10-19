//
//  SecondCoordinator.swift
//  ReactorKitPractice
//
//  Created by 홍승현 on 2022/10/19.
//

import UIKit

final class SecondCoordinator: BaseCoordinator {
  
  override func start() {
    let vc = SecondViewController()
    vc.coordinator = self
    navigationController.pushViewController(vc, animated: true)
  }
  
  deinit {
    print("2 Coor deinit")
  }
}
