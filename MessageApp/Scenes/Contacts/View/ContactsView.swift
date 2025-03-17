//
//  ContactsView.swift
//  UIKit+SwiftUI+Coordinator
//
//  Created by Volodymyr Kozlov on 16.03.2025.
//

import SwiftUI

struct ContactsView: View {
    @ObservedObject var viewModel: ContactsViewModel
    
    var body: some View {
        let state = viewModel.viewState
        
        VStack(spacing: 16) {
            Text(state.title)
                .font(.largeTitle)
            
            Button("Tap me") {
                viewModel.perform(.buttonTapped)
            }
        }
        .background(state.backgroundColor)
        .padding()
    }
}
