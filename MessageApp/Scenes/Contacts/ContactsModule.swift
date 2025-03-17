//
//  ContactsModule.swift
//  UIKit+SwiftUI+Coordinator
//
//  Created by Volodymyr Kozlov on 16.03.2025.
//

import UIKit

final class ContactsModule: BaseModule {
    func viewController() -> UIViewController {
        let viewStateFactory = ContactsViewStateFactory()
        let viewModel = ContactsViewModel(viewStateFactory: viewStateFactory)
        let view = ContactsView(viewModel: viewModel)
        let viewController = ContactsViewController(viewModel: viewModel, rootView: view)
        return viewController
    }
}
