//
//  AuthViewStateFactory.swift
//  UIKit+SwiftUI+Coordinator
//
//  Created by Volodymyr Kozlov on 16.03.2025.
//

import SwiftUI

final class AuthViewStateFactory {
    func makeState() -> AuthViewState {
        return .init(
            title: "Sign In"
        )
    }
}
