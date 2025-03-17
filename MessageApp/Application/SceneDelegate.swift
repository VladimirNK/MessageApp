//
//  SceneDelegate.swift
//  UIKit+SwiftUI+Coordinator
//
//  Created by Volodymyr Kozlov on 16.03.2025.
//

import UIKit
import Firebase

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        appCoordinator = AppCoordinator(window: window!)
        appCoordinator?.start()
        FirebaseApp.configure()
    }
}
