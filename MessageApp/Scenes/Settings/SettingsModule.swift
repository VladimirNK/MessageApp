//
//  SettingsModule.swift
//  UIKit+SwiftUI+Coordinator
//
//  Created by Volodymyr Kozlov on 16.03.2025.
//

import UIKit

final class SettingsModule: BaseModule {
    func viewController() -> UIViewController {
        let viewStateFactory = SettingsViewStateFactory()
        let viewModel = SettingsViewModel(viewStateFactory: viewStateFactory)
        let view = SettingsView(viewModel: viewModel)
        let viewController = SettingsViewController(viewModel: viewModel, rootView: view)
        return viewController
    }
}
