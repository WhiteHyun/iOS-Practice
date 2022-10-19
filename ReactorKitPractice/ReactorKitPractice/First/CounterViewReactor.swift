import UIKit
import ReactorKit
import RxCocoa

class CounterViewReactor: Reactor {
  
  let initialState = State()
  
  enum Action {
    case increase
    case decrease
    case nextButtonTapped
  }
  
  enum Mutation {
    case increaseValue
    case decreaseValue
    case setLoading(Bool)
    case moveScreen(Bool)
  }
  
  struct State {
    var value: Int = 0
    var isLoading: Bool = false
    var isMoved: Bool = false
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
    case .decrease:
      return Observable.concat(
        [
          Observable.just(Mutation.setLoading(true)),
          Observable.just(Mutation.decreaseValue)
            .delay(.seconds(1), scheduler: MainScheduler.instance),
          Observable.just(Mutation.setLoading(false))
        ]
      )
      
    case .nextButtonTapped:
      return Observable.concat(
        [
          Observable.just(Mutation.moveScreen(true)),
          Observable.just(Mutation.moveScreen(false))
        ]
         )
    }
  }
  
  
  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    
    switch mutation {
    case .increaseValue:
      newState.value += 1
    case .decreaseValue:
      newState.value -= 1
    case let .setLoading(isLoading):
      newState.isLoading = isLoading
    case let .moveScreen(boolValue):
      newState.isMoved = boolValue
    }
    return newState
  }
}
