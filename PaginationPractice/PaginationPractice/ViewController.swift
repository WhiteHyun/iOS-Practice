//
//  ViewController.swift
//  PaginationPractice
//
//  Created by 홍승현 on 2022/09/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  private let apiCaller = APICaller()

  private let tableView: UITableView = {
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    return tableView
  }()

  private var data = [String]()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(tableView)
    view.backgroundColor = .lightGray
    tableView.dataSource = self
    tableView.delegate = self
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableView.frame = view.bounds

    apiCaller.fetchData(pagination: false) { [weak self] result in
      switch result {
      case .success(let data):
        self?.data.append(contentsOf: data)
        DispatchQueue.main.async {
          self?.tableView.reloadData()
        }
      case .failure:
        break
      }
    }
  }

  private func createSpinnerFooter() -> UIView {

    let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 100))
    let spinner = UIActivityIndicatorView()
    spinner.center = footerView.center
    footerView.addSubview(spinner)
    spinner.startAnimating()
    return footerView
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    var configuration = cell.defaultContentConfiguration()

    configuration.text = data[indexPath.row]
    cell.contentConfiguration = configuration

    return cell
  }

  // MARK: - 1번째 방법: TableViewWillDisplay
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    guard !apiCaller.isPaginating,
          indexPath.row > self.data.endIndex - 3 else {
      return
    }
    print("fetch more")
    self.tableView.tableFooterView = createSpinnerFooter()

    apiCaller.fetchData(pagination: true) { [weak self] result in
      DispatchQueue.main.async {
        self?.tableView.tableFooterView = nil
      }
      switch result {
      case .success(let moreData):
        self?.data.append(contentsOf: moreData)
        DispatchQueue.main.async {
          self?.tableView.reloadData()
        }
      case .failure:
        break
      }
    }
  }
}

// extension ViewController: UIScrollViewDelegate {
//
//  // MARK: - 2번째 방법: scrollViewDelegate
//  func scrollViewDidScroll(_ scrollView: UIScrollView) {
//    let position = scrollView.contentOffset.y
//    guard !apiCaller.isPaginating,
//          position > self.tableView.contentSize.height - scrollView.bounds.height - 100 else {
//      return
//    }
//    print("fetch more")
//
//    self.tableView.tableFooterView = createSpinnerFooter()
//
//    apiCaller.fetchData(pagination: true) { [weak self] result in
//      DispatchQueue.main.async {
//        self?.tableView.tableFooterView = nil
//      }
//      switch result {
//      case .success(let moreData):
//        self?.data.append(contentsOf: moreData)
//        DispatchQueue.main.async {
//          self?.tableView.reloadData()
//        }
//      case .failure:
//        break
//      }
//    }
//  }
// }
