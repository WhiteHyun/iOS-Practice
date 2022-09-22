//
//  Coordinator.swift
//  MVVM-Coordinators
//
//  Created by 홍승현 on 2022/06/24.
//

import UIKit

protocol Coordinator: AnyObject {
  
  var childCoordinators: [Coordinator] { get set }
  var navigationController: UINavigationController { get set }
  
  func start()
  
}
