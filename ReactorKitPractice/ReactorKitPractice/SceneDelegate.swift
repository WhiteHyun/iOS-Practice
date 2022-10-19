//
//  SceneDelegate.swift
//  ReactorKitPractice
//
//  Created by 홍승현 on 2022/08/28.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?
  var coordinator: AppCoordinator?


  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
    guard let windowScene = scene as? UIWindowScene else { return }
    window = UIWindow(windowScene: windowScene)
    
    let navVC = UINavigationController()
    window?.rootViewController = navVC
    window?.makeKeyAndVisible()
    
    
    coordinator = AppCoordinator(navigationController: navVC)
    coordinator?.start()
  }
}

