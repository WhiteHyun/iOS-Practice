//
//  ViewController.swift
//  PageControl
//
//  Created by 홍승현 on 2022/11/19.
//

import UIKit

import SnapKit
import Then

final class ViewController: UIViewController {
  
  private let pageControl: UIPageControl = UIPageControl().then {
    $0.numberOfPages = 5
    $0.currentPage = 1
    $0.currentPageIndicatorTintColor = .orange
    $0.pageIndicatorTintColor = .lightGray
    $0.backgroundColor = .systemGray
  }
  
  private let customPageControl: CustomPageControl = CustomPageControl().then {
    $0.currentPageIndicatorTintColor = .orange
    $0.pageIndicatorTintColor = .lightGray
    $0.numberOfPages = 5
    $0.currentPage = 1
    $0.backgroundColor = .systemGray
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.addSubview(pageControl)
    self.view.addSubview(customPageControl)
    
    self.pageControl.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.centerY.equalToSuperview().offset(-100)
      make.height.equalTo(100)
    }
    
    self.customPageControl.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.centerY.equalToSuperview().offset(100)
      make.height.equalTo(100)
    }
  }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct ViewControllerPreview: PreviewProvider {
  static var previews: some View {
    ViewController().toPreview()
  }
}
#endif

