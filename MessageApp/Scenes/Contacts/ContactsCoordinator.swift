//
//  ContactsCoordinator.swift
//  UIKit+SwiftUI+Coordinator
//
//  Created by Volodymyr Kozlov on 16.03.2025.
//

import UIKit

final class ContactsCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    private let router: RouterProtocol
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    func start() {
        let contactsModule = ContactsModule()
        guard let contactsViewController = contactsModule.viewController() as? ContactsViewController else { return }
        contactsViewController.viewModel.output = { [weak self] output in
            self?.handle(output: output)
        }
        router.navigationController?.viewControllers = [contactsViewController]
    }
}

private extension ContactsCoordinator {
    func handle(output: ContactsViewModel.Output) {
        switch output {
        case .showDetails:
            print("show Details")
        case .showAlert:
            print("show Alert")
        }
    }
}
