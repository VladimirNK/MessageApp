//
//  MainTabBarCoordinator.swift
//  UIKit+SwiftUI+Coordinator
//
//  Created by Volodymyr Kozlov on 16.03.2025.
//

import UIKit

final class MainTabBarCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    private let window: UIWindow
    private let tabBarController = UITabBarController()

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        // Contacts Tab
        let contactsNavController = UINavigationController()
        contactsNavController.tabBarItem = UITabBarItem(title: "Contacts", image: UIImage(systemName: "person"), tag: 0)
        let contactsRouter = BaseRouter(navigationController: contactsNavController)
        let contactsCoordinator = ContactsCoordinator(router: contactsRouter)
        contactsCoordinator.start()

        // Chats Tab
        let chatsNavController = UINavigationController()
        chatsNavController.tabBarItem = UITabBarItem(title: "Chats", image: UIImage(systemName: "message"), tag: 1)
        let chatsRouter = BaseRouter(navigationController: chatsNavController)
        let chatsCoordinator = ChatsCoordinator(router: chatsRouter)
        chatsCoordinator.start()

        // Settings Tab
        let settingsNavController = UINavigationController()
        settingsNavController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 2)
        let settingsRouter = BaseRouter(navigationController: settingsNavController)
        let settingsCoordinator = SettingsCoordinator(router: settingsRouter)
        settingsCoordinator.start()

        childCoordinators = [contactsCoordinator, chatsCoordinator, settingsCoordinator]

        tabBarController.viewControllers = [contactsNavController, chatsNavController, settingsNavController]
        tabBarController.tabBar.tintColor = .systemBlue

        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
}

