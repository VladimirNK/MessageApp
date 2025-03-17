//
//  AuthModule.swift
//  UIKit+SwiftUI+Coordinator
//
//  Created by Volodymyr Kozlov on 16.03.2025.
//

import UIKit

final class AuthModule: BaseModule {
    func viewController() -> UIViewController {
        let viewStateFactory = AuthViewStateFactory()
        let viewModel = AuthViewModel()
        let view = AuthView(viewModel: viewModel)
        let viewController = AuthViewController(viewModel: viewModel, rootView: view)
        return viewController
    }
}
