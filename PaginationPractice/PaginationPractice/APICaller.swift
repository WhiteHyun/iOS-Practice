import Foundation

class APICaller {

  var isPaginating = false

  func fetchData(pagination: Bool = false, completion: @escaping (Result<[String], Error>) -> Void) {
    if pagination {
      isPaginating = true
    }
    DispatchQueue.global().asyncAfter(deadline: .now() + (pagination ? 3 : 2)) {
      let originData = [Int](1...30).map { String($0) }

      let newData = ["banana", "oranges", "grapes", "Food"]

      completion(.success(pagination ? newData : originData))
      if pagination {
        self.isPaginating = false
      }
    }
  }
}
