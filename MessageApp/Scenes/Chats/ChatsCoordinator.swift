//
//  ChatsCoordinator.swift
//  UIKit+SwiftUI+Coordinator
//
//  Created by Volodymyr Kozlov on 16.03.2025.
//

import UIKit

final class ChatsCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    private let router: RouterProtocol
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    func start() {
        let chatsModule = ChatsModule()
        guard let chatsViewController = chatsModule.viewController() as? ChatsViewController else { return }
        chatsViewController.viewModel.output = { [weak self] output in
            self?.handle(output: output)
        }
        router.navigationController?.viewControllers = [chatsViewController]
    }
}

private extension ChatsCoordinator {
    func handle(output: ChatsViewModel.Output) {
        switch output {
        case .showDetails:
            print("show Details")
        case .showAlert:
            print("show Alert")
        }
    }
}
