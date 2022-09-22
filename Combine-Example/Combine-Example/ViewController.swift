//
//  ViewController.swift
//  Combine-Example
//
//  Created by 홍승현 on 2022/07/25.
//

import Combine
import UIKit

struct User: Codable {
  let name: String
}


class ViewController: UIViewController {
  
  private let url = URL(string: "https://jsonplaceholder.typicode.com/users")
  private var observer: AnyCancellable?
  private var users: [User] = []
  private lazy var tableView: UITableView = {
    let table = UITableView()
    table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    table.dataSource = self
    return table
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(tableView)
    tableView.frame = view.bounds
    view.backgroundColor = .white
    observer = fetchUsers()
      .receive(on: DispatchQueue.main)
      .sink { [weak self] users in
      self?.users = users
      self?.tableView.reloadData()
    }
  }
  
  
  func fetchUsers() -> AnyPublisher<[User], Never> {
    
    guard let url = url else {
      return Just([])
        .eraseToAnyPublisher()
    }
    return URLSession.shared.dataTaskPublisher(for: url)
      .map { $0.data }
      .decode(type: [User].self, decoder: JSONDecoder())
      .catch { _ in Just([]) }
      .eraseToAnyPublisher()
  }
}

extension ViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return users.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    
    cell.textLabel?.text = users[indexPath.row].name
    return cell
  }
}
