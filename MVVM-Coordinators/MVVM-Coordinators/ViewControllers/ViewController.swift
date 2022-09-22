//
//  ViewController.swift
//  MVVM-Coordinators
//
//  Created by 홍승현 on 2022/06/24.
//

import UIKit

class ViewController: UIViewController {
  
  weak var coordinator: MainCoordinator?
  
  lazy var buyButton: UIButton = {
    let button = UIButton()
    button.setTitle("Buy", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .systemGray
    
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  
  lazy var createAccountButton: UIButton = {
    let button = UIButton()
    button.setTitle("Create Account", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .systemGray
    
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  lazy var stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.alignment = .center
    stackView.distribution = .fillProportionally
    stackView.axis = .vertical
    stackView.spacing = 15
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemRed
    
    buyButton.addTarget(self, action: #selector(buyTapped), for: .touchUpInside)
    createAccountButton.addTarget(self, action: #selector(createAccountTapped), for: .touchUpInside)
    
    [buyButton, createAccountButton].forEach {
      stackView.addArrangedSubview($0)
    }
    view.addSubview(stackView)
    
    NSLayoutConstraint.activate(
      [
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        buyButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
        createAccountButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
        buyButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
        createAccountButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
      ]
    )
    
  }
  
  @objc func buyTapped() {
    coordinator?.buySubscription(to: 50)
  }
  
  @objc func createAccountTapped() {
    coordinator?.createAccount()
  }
  
}

