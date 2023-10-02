//
//  serviceMan_reduxApp.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 29.04.2023.
//

import SwiftUI

let store = Store(
    initial: AppState(),
    reducer: AppState.reducer,
    middlewares: [Middlewares.eventList, Middlewares.logger, Middlewares.user]
)

let coordinatesMiddleware = CoordinatesMiddleware()
let phoneMiddleware = PhoneMiddleware()

@main
struct serviceMan_reduxApp: App {
    var body: some Scene {
        WindowGroup {
            BaseView()
                .environmentObject(store)
        }
    }
}

struct BaseView: View {
    @EnvironmentObject var store: Store<AppState>
    @State var isLoggedIn = true

    var body: some View {
        Group {
            if (store.state.screenState(for: .loginView) as LoginViewState?)?.loggedUser != nil || store.state.screenState(for: .tabBar) as TabBarState? != nil {
                MainTabView()
                    .environmentObject((store.state.screenState(for: .loginView) as LoginViewState?)?.loggedUser ?? User.sampleData)
                    .onAppear( perform: {
                        store.dispatch(ActiveScreensStateAction.showScreen(.tabBar))
                    })
            } else {
                LoginView()
            }
        }
    }
}
