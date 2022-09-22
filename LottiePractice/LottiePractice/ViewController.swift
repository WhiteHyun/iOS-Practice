//
//  ViewController.swift
//  LottiePractice
//
//  Created by 홍승현 on 2022/08/20.
//

import UIKit

import Lottie

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let animationView = AnimationView(name: "dataTest")
    animationView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
    animationView.center = view.center
    animationView.contentMode = .scaleAspectFill
    animationView.loopMode = .loop
    
    view.addSubview(animationView)
    
    animationView.play { flag in
      print(flag)
      print("Completed")
    }
  }
}

