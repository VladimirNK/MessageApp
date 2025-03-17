//
//  ChatsModule.swift
//  UIKit+SwiftUI+Coordinator
//
//  Created by Volodymyr Kozlov on 16.03.2025.
//

import UIKit

final class ChatsModule: BaseModule {
    func viewController() -> UIViewController {
        let viewStateFactory = ChatsViewStateFactory()
        let viewModel = ChatsViewModel(viewStateFactory: viewStateFactory)
        let view = ChatsView(viewModel: viewModel)
        let viewController = ChatsViewController(viewModel: viewModel, rootView: view)
        return viewController
    }
}
