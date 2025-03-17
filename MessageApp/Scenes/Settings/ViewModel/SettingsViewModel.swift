//
//  SettingsViewModel.swift
//  UIKit+SwiftUI+Coordinator
//
//  Created by Volodymyr Kozlov on 16.03.2025.
//

import SwiftUI

final class SettingsViewModel: ObservableObject {
    enum Action {
        case buttonTapped
        case onDidAppear
    }
    
    enum Output {
        case showDetails
        case showAlert
    }
    
    @Published private(set) var viewState: SettingsViewState
    
    private let viewStateFactory: SettingsViewStateFactory
    private var title: String = "Hello, Settings"
    private var backgrounColor: Color = .clear
    
    var output: CallbackWith<Output>?
    
    init(viewStateFactory: SettingsViewStateFactory) {
        self.viewStateFactory = viewStateFactory
        self.viewState = viewStateFactory.makeState(title: title, backgroundColor: backgrounColor)
    }
    
    func perform(_ action: Action) {
        switch action {
        case .buttonTapped:
            handleButtonTapped()
        case .onDidAppear:
            changeColorOnDidAppear()
        }
    }
}

private extension SettingsViewModel {
    func handleButtonTapped() {
        title = "Button Tapped"
        updateView()
        output?(.showDetails)
    }
    
    func changeColorOnDidAppear() {
        backgrounColor = .red
        updateView()
    }
    
    func updateView() {
        viewState = viewStateFactory.makeState(title: title, backgroundColor: backgrounColor)
    }
}
