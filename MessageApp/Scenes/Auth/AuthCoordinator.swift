//
//  AuthCoordinator.swift
//  UIKit+SwiftUI+Coordinator
//
//  Created by Volodymyr Kozlov on 16.03.2025.
//

import UIKit

final class AuthCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    private let window: UIWindow
    var completion: Callback?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let authModule = AuthModule()
        guard let authViewController = authModule.viewController() as? AuthViewController else { return }
        authViewController.viewModel.output = { [weak self] output in
            switch output {
            case .loginCompleted:
                self?.completion?()
            }
        }
        let navigationController = UINavigationController(rootViewController: authViewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
