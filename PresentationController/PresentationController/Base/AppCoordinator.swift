import UIKit

final class AppCoordinator: BaseCoordinator {

  override func start() {
    self.navigationController.delegate = self

    // == first launch check ==
    let coordinator = FirstCoordinator(navigationController: self.navigationController)
    start(childCoordinator: coordinator)
  }
}

// MARK: - Delegates

extension AppCoordinator: UINavigationControllerDelegate {

  func navigationController(
    _ navigationController: UINavigationController,
    didShow viewController: UIViewController,
    animated: Bool
  ) {
    guard let fromVC = navigationController.transitionCoordinator?.viewController(forKey: .from) as? BaseViewController,
          let coordinator = fromVC.coordinator
    else { return }

    if navigationController.viewControllers.contains(fromVC) { return }

    // Coordinators must have their own parents except for the `AppCoordinator`.
    assert(coordinator.parentCoordinator != nil)

    coordinator.parentCoordinator?.finish(childCoordinator: coordinator)
  }
}
