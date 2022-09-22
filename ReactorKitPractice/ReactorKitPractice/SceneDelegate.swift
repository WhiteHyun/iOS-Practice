//
//  SceneDelegate.swift
//  ReactorKitPractice
//
//  Created by 홍승현 on 2022/08/28.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?


  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
    guard let _ = (scene as? UIWindowScene) else { return }
    
    
    let vc = window?.rootViewController as? ViewController
    
    let counterViewReactor = CounterViewReactor()
    vc?.reactor = counterViewReactor
  }
}

