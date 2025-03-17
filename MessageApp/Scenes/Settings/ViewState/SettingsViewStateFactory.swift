//
//  SettingsViewStateFactory.swift
//  UIKit+SwiftUI+Coordinator
//
//  Created by Volodymyr Kozlov on 16.03.2025.
//

import SwiftUI

final class SettingsViewStateFactory {
    func makeState(title: String, backgroundColor: Color) -> SettingsViewState {
        return .init(
            title: title,
            backgroundColor: backgroundColor
        )
    }
}
