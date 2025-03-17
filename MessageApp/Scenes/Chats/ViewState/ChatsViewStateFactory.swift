//
//  ChatsViewStateFactory.swift
//  UIKit+SwiftUI+Coordinator
//
//  Created by Volodymyr Kozlov on 16.03.2025.
//

import SwiftUI

final class ChatsViewStateFactory {
    func makeState(title: String, backgroundColor: Color) -> ChatsViewState {
        return .init(
            title: title,
            backgroundColor: backgroundColor
        )
    }
}
