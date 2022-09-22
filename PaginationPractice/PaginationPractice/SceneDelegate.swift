//
//  SceneDelegate.swift
//  PaginationPractice
//
//  Created by 홍승현 on 2022/09/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    guard let scene = scene as? UIWindowScene else { return }
    window = UIWindow(windowScene: scene)
    window?.rootViewController = ViewController()
    window?.makeKeyAndVisible()
  }
}
