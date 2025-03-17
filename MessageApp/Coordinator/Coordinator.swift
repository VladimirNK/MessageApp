//
//  Coordinator.swift
//  UIKit+SwiftUI+Coordinator
//
//  Created by Volodymyr Kozlov on 16.03.2025.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    func start()
}

final class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        if isUserLoggedIn() {
            showMainTabBar()
        } else {
            showAuthFlow()
        }
    }

    private func isUserLoggedIn() -> Bool {
        return false
    }

    private func showAuthFlow() {
        let authCoordinator = AuthCoordinator(window: window)
        authCoordinator.completion = { [weak self] in
            self?.childCoordinators.removeAll { $0 === authCoordinator }
            self?.showMainTabBar()
        }
        childCoordinators.append(authCoordinator)
        authCoordinator.start()
    }

    private func showMainTabBar() {
        let mainTabBarCoordinator = MainTabBarCoordinator(window: window)
        childCoordinators.append(mainTabBarCoordinator)
        mainTabBarCoordinator.start()
    }
}

