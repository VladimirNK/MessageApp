//
//  SettingsCoordinator.swift
//  UIKit+SwiftUI+Coordinator
//
//  Created by Volodymyr Kozlov on 16.03.2025.
//

import UIKit

final class SettingsCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    private let router: RouterProtocol
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    func start() {
        let settingsModule = SettingsModule()
        guard let settingsViewController = settingsModule.viewController() as? SettingsViewController else { return }
        settingsViewController.viewModel.output = { [weak self] output in
            self?.handle(output: output)
        }
        router.navigationController?.viewControllers = [settingsViewController]
    }
}

private extension SettingsCoordinator {
    func handle(output: SettingsViewModel.Output) {
        switch output {
        case .showDetails:
            print("show Details")
        case .showAlert:
            print("show Alert")
        }
    }
}
