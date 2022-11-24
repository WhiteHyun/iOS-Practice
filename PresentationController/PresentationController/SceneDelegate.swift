//
//  SceneDelegate.swift
//  PresentationController
//
//  Created by 홍승현 on 2022/11/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?
  var coordinator: AppCoordinator?


  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = scene as? UIWindowScene else { return }
    window = UIWindow(windowScene: windowScene)
    let navVC = UINavigationController()
    
    coordinator = AppCoordinator(navigationController: navVC)
    coordinator?.start()
    window?.rootViewController = navVC
    window?.makeKeyAndVisible()
  }
}

