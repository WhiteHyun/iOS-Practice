import UIKit
import ReactorKit
import RxCocoa

class CounterViewReactor: Reactor {
  
  let initialState = State()
  
  enum Action {
    case increase
    case decrease
  }
  
  enum Mutation {
    case increaseValue
    case decreaseValue
    case setLoading(Bool)
  }
  
  struct State {
    var value: Int = 0
    var isLoading: Bool = false
  }
  
  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
      
    case .increase:
      return Observable.concat(
        [
          Observable.just(Mutation.setLoading(true)),
          Observable.just(Mutation.increaseValue)
            .delay(.seconds(1), scheduler: MainScheduler.instance),
          Observable.just(Mutation.setLoading(false))
        ]
      )
      //Observable.just(Mutation.increaseValue)
    case .decrease:
      return Observable.concat(
        [
          Observable.just(Mutation.setLoading(true)),
          Observable.just(Mutation.decreaseValue)
            .delay(.seconds(1), scheduler: MainScheduler.instance),
          Observable.just(Mutation.setLoading(false))
        ]
      )
      //Observable.just(Mutation.decreaseValue)
    }
  }
  
  
  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    
    switch mutation {
    case .increaseValue:
      newState.value += 1
    case .decreaseValue:
      newState.value -= 1
    // case .setLoading(let bool):
    case let .setLoading(isLoading):
      newState.isLoading = isLoading
    }
    
    return newState
  }
}
