//
//  ViewController.swift
//  ReactorKitPractice
//
//  Created by 홍승현 on 2022/08/28.
//

import UIKit
import ReactorKit
import RxCocoa

final class ViewController: UIViewController, View {
  
  private let activityIndicatorView: UIActivityIndicatorView = {
    let activityIndicatorView = UIActivityIndicatorView()
    activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
    return activityIndicatorView
  }()
  
  private let decreaseButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("-", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let increaseButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("+", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let numberLabel: UILabel = {
    let label = UILabel()
    label.text = "0"
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.distribution = .fillEqually
    stackView.spacing = 10
    stackView.alignment = .fill
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  var disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    [self.decreaseButton, self.numberLabel, self.increaseButton].forEach {
      self.stackView.addArrangedSubview($0)
    }
    self.view.addSubview(stackView)
    self.view.addSubview(activityIndicatorView)
    
    NSLayoutConstraint.activate(
      [
        self.stackView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
        self.stackView.heightAnchor.constraint(equalToConstant: 200),
        self.stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
        self.stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
        self.activityIndicatorView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        self.activityIndicatorView.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 20)
      ]
    )
  }
  
  func bind(reactor: CounterViewReactor) {
    // Action
    self.increaseButton.rx.tap
      .map { Reactor.Action.increase }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)
    
    self.decreaseButton.rx.tap
      .map { Reactor.Action.decrease }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)
    
    // State
    reactor.state
      .map { $0.value }
      .distinctUntilChanged()
      .map { "\($0)" }
      .bind(to: self.numberLabel.rx.text)
      .disposed(by: disposeBag)
    
    
    reactor.state
      .map { $0.isLoading }
      .distinctUntilChanged()
      .bind(to: self.activityIndicatorView.rx.isAnimating)
      .disposed(by: disposeBag)
  }
}

