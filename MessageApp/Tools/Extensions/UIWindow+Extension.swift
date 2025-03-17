//
//  UIWindow+Extension.swift
//  UIKit+SwiftUI+Coordinator
//
//  Created by Volodymyr Kozlov on 16.03.2025.
//

import UIKit

extension UIWindow {
    func replaceRootViewControllerWith(
        _ replacementController: UIViewController,
        animated: Bool,
        completion: Callback? = nil
    ) {
        let snapshotImageView = UIImageView(image: self.snapshot())
        addSubview(snapshotImageView)
        
        let dismissCompletion: Callback = {
            self.rootViewController = replacementController
            self.bringSubviewToFront(snapshotImageView)
            if animated {
                UIView.animate(
                    withDuration: Constant.animationDuration,
                    animations: { snapshotImageView.alpha = 0 },
                    completion: { _ in
                        snapshotImageView.removeFromSuperview()
                        completion?()
                    }
                )
            } else {
                snapshotImageView.removeFromSuperview()
                completion?()
            }
        }
        
        if let rootViewController = rootViewController, rootViewController.presentedViewController != nil {
            rootViewController.dismiss(
                animated: false,
                completion: dismissCompletion
            )
        } else {
            dismissCompletion()
        }
    }
    
}

private extension UIWindow {
    enum Constant {
        static let animationDuration: TimeInterval = 0.2
    }
}
