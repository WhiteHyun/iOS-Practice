//
//  ViewController.swift
//  GitHookTest
//
//  Created by 홍승현 on 2022/07/25.
//

import UIKit

class ViewController: UIViewController {

  private lazy var label = UILabel()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white

    view.addSubview(label)

    label.text = "Hello, World!"
    label.sizeToFit()
    label.center = view.center
    let testBecaum = UIGraphicsGetCurrentContext()!
  }
}
