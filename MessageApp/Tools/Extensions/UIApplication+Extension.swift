//
//  UIApplication+Extension.swift
//  UIKit+SwiftUI+Coordinator
//
//  Created by Volodymyr Kozlov on 16.03.2025.
//

import UIKit

extension UIApplication {
    static var activeWindow: UIWindow? {
        return UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
    }
}
