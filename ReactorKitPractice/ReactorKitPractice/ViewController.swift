//
//  ViewController.swift
//  ReactorKitPractice
//
//  Created by 홍승현 on 2022/08/28.
//

import UIKit
import ReactorKit
import RxCocoa

final class ViewController: UIViewController, StoryboardView {
  
  @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
  @IBOutlet weak var decreaseButton: UIButton!
  @IBOutlet weak var increaseButton: UIButton!
  @IBOutlet weak var numberLabel: UILabel!
  
  var disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  func bind(reactor: CounterViewReactor) {
    // Action
    increaseButton.rx.tap
      .map { Reactor.Action.increase }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)
    
    decreaseButton.rx.tap
      .map { Reactor.Action.decrease }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

    // State
    reactor.state
      .map { $0.value }
      .distinctUntilChanged()
      .map { "\($0)" }
      .bind(to: numberLabel.rx.text)
      .disposed(by: disposeBag)
    
    
    reactor.state
      .map { $0.isLoading }
      .distinctUntilChanged()
      .bind(to: activityIndicatorView.rx.isAnimating)
      .disposed(by: disposeBag)
  }
}

