//
//  ViewController.swift
//  RxPractice
//
//  Created by 홍승현 on 2022/09/11.
//

import UIKit

import RxSwift
import RxCocoa

class ViewController: UIViewController {

  private var textField: UITextField = {
    let field = UITextField()
    field.keyboardType = .numberPad
    field.borderStyle = .roundedRect
    return field
  }()
  
  private let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    view.addSubview(textField)
    textField.frame = CGRect(x: view.bounds.width/2 - 150, y: view.bounds.height / 2 - 35, width: 300, height: 70)
    
    textField.text = "50"
    let bill = Float(textField.text ?? "0.0") ?? 0.0
    let amount = bill + bill * 0.1
    print(amount)
    
//    textField.rx.text
//      .compactMap { $0 }
//      .subscribe(onNext: {
//        print($0)
//      })
//      .disposed(by: disposeBag)
  }
}

