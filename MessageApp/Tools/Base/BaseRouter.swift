//
//  BaseRouter\.swift
//  UIKit+SwiftUI+Coordinator
//
//  Created by Volodymyr Kozlov on 16.03.2025.
//

import UIKit

protocol RouterProtocol: AnyObject {
    var navigationController: UINavigationController? { get }
    func openModule(_ module: BaseModule, animated: Bool)
    func pop(animated: Bool)
    func dismiss(animated: Bool, completion: Callback?)
    func replaceRootModule(
        with module: BaseModule,
        animated: Bool,
        completion: Callback?
    )
}

final class BaseRouter: RouterProtocol {
    weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func openModule(_ module: BaseModule, animated: Bool = true) {
        let controller = module.viewController()
        navigationController?.pushViewController(controller, animated: animated)
    }

    func pop(animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }

    func dismiss(animated: Bool = true, completion: Callback? = nil) {
        navigationController?.dismiss(animated: animated, completion: completion)
    }
    
    func replaceRootModule(
        with module: BaseModule,
        animated: Bool = true,
        completion: Callback? = nil
    ) {
        onMainQueue {
            guard let window = UIApplication.activeWindow else {
                return
            }
            window.replaceRootViewControllerWith(module.viewController(), animated: true) {
                completion?()
            }
        }
    }
}
