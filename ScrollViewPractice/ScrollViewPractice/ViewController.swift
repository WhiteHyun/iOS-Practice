//
//  ViewController.swift
//  ScrollViewPractice
//
//  Created by 홍승현 on 2022/09/28.
//

import UIKit

import SnapKit
import Then

final class ViewController: UIViewController {

  private let scrollView = UIScrollView()
  
  private let contentView = UIView()
  
  private let ipsumLabel = UILabel().then {
    $0.numberOfLines = 0
    $0.text = """
Where does it come from?
Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.

The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.

Where can I get some?
There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chu
"""
  }
  
  private let footerLabel = UILabel().then {
    $0.text = "마지막입니다."
  }
  
  private let stackView = UIStackView().then {
    $0.distribution = .fill
    $0.alignment = .fill
    $0.spacing = 40
    $0.axis = .vertical
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .lightGray
    stackView.addArrangedSubview(ipsumLabel)
    stackView.addArrangedSubview(footerLabel)
    
    view.addSubview(scrollView)
    scrollView.addSubview(contentView)
    contentView.addSubview(stackView)
    
    scrollView.snp.makeConstraints { make in
      make.edges.equalTo(view.safeAreaLayoutGuide)
    }
    
    contentView.snp.makeConstraints { make in
      make.edges.equalTo(scrollView.contentLayoutGuide)
      make.width.equalTo(scrollView.frameLayoutGuide)
    }
    
    stackView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
}
