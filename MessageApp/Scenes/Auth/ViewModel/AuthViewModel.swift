//
//  AuthViewModel.swift
//  UIKit+SwiftUI+Coordinator
//
//  Created by Volodymyr Kozlov on 16.03.2025.
//

import SwiftUI

final class AuthViewModel: ObservableObject {
    enum Action {
        case buttonTapped
        case onDidAppear
    }
    
    enum Output {
        case loginCompleted
    }
    
    //@Published private(set) var viewState: AuthViewState
    
    //private let viewStateFactory: AuthViewStateFactory
   
    @Published var email: String = .empty
    @Published var password: String = .empty
    
    var output: CallbackWith<Output>?
    
//    init(viewStateFactory: AuthViewStateFactory) {
//        self.viewStateFactory = viewStateFactory
//        self.viewState = viewStateFactory.makeState()
//    }
    
    func perform(_ action: Action) {
        switch action {
        case .buttonTapped:
            //handleButtonTapped()
            return
        case .onDidAppear:
            //changeColorOnDidAppear()
            return
        }
    }
}

private extension AuthViewModel {
    
}
