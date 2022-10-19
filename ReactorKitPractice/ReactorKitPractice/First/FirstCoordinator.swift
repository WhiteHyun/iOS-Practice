//
//  FirstCoordinator.swift
//  ReactorKitPractice
//
//  Created by 홍승현 on 2022/10/19.
//

import UIKit

import ReactorKit
import RxSwift
import RxCocoa

final class FirstCoordinator: BaseCoordinator {
  
  
  let disposeBag = DisposeBag()
  
  override func start() {
    let vc = ViewController()
    let reactor = CounterViewReactor()
    vc.reactor = reactor
    bind(reactor: reactor)
    navigationController.setViewControllers([vc], animated: false)
  }
  
  private func bind(reactor: CounterViewReactor) {
    
    reactor.state
      .map(\.isMoved)
      .filter { $0 }
      .subscribe(onNext: { [weak self] _ in
        guard let self = self else { return }
        let coordinator = SecondCoordinator(navigationController: self.navigationController)
        self.start(coordinator: coordinator)
      })
      .disposed(by: disposeBag)
  }
}
