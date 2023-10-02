//
//  serviceMan_mvvmApp.swift
//  serviceMan-mvvm
//
//  Created by Pavel Odstrčilík on 19.04.2023.
//

import SwiftUI

@main
struct serviceMan_mvvmApp: App {
    var body: some Scene {
        WindowGroup {
            BaseView()
        }
    }
}


struct BaseView: View {
    @StateObject var viewModel = LoginViewModel()

    var body: some View {
        Group {
            if viewModel.isLoggedIn {
                withAnimation {
                    MainTabView(isLogged:
                                    $viewModel.isLoggedIn)
                        .environmentObject(viewModel.loggedUser)
                }
            } else {
                LoginView(viewModel: viewModel)
            }
        }
    }
}
