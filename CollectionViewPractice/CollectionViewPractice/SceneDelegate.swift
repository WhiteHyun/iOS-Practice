//
//  SceneDelegate.swift
//  CollectionViewPractice
//
//  Created by 홍승현 on 2022/10/05.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?


  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    window = UIWindow(windowScene: windowScene)
//    window?.rootViewController = UINavigationController(rootViewController: FlowLayoutPracticeVC())
    window?.rootViewController = UINavigationController(rootViewController: ExpandablePracticeVC())
    window?.makeKeyAndVisible()
  }
}
