//
//  ContactsViewStateFactory.swift
//  UIKit+SwiftUI+Coordinator
//
//  Created by Volodymyr Kozlov on 16.03.2025.
//

import SwiftUI

final class ContactsViewStateFactory {
    func makeState(title: String, backgroundColor: Color) -> ContactsViewState {
        return .init(
            title: title,
            backgroundColor: backgroundColor
        )
    }
}
