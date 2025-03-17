//
//  BaseViewController.swift
//  UIKit+SwiftUI+Coordinator
//
//  Created by Volodymyr Kozlov on 16.03.2025.
//

import SwiftUI

class BaseViewController<Content: View, ViewModel: ObservableObject>: UIHostingController<Content> {
    let viewModel: ViewModel
    
    init(viewModel: ViewModel, rootView: Content) {
        self.viewModel = viewModel
        super.init(rootView: rootView)
    }
    
    @MainActor @preconcurrency required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
