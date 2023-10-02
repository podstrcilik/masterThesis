//
//  LoginView.swift
//  serviceMan-mvvm
//
//  Created by Pavel Odstrčilík on 19.04.2023.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var store: Store<AppState>
    var state: LoginViewState? { store.state.screenState(for: .loginView) }

    var body: some View {
        ZStack {
            if let state {
                if state.isLoading {
                    ProgressView("Přihlašování...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                        .background(Color.systemGray2)
                        .cornerRadius(10)
                        .zIndex(1)
                }
                VStack {
                    VStack {
                        LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .top, endPoint: .bottom)
                            .mask(
                                VStack{
                                    Image(systemName: "wrench.and.screwdriver.fill")
                                        .resizable()
                                        .frame(width: 180, height: 180).padding()
                                    Text("Service man").font(.title).bold()

                                })
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text("Jméno")
                            TextField(
                                "Jméno",
                                text: Binding(get: { state.credentials.name }, set: { store.dispatch(LoginViewStateAction.updateNameText($0))})
                            )
                            .padding()
                            .background(Color.systemGray5)
                            .cornerRadius(5.0)
                            .autocorrectionDisabled(true)
                        }.padding()
                        VStack(alignment: .leading) {
                            Text("Heslo")
                            SecureField(
                                "Heslo",
                                text: Binding(get: { state.credentials.password }, set: { store.dispatch(LoginViewStateAction.updatePasswordText($0))})
                            )
                            .padding()
                            .background(Color.systemGray5)
                            .cornerRadius(5.0)
                        }.padding()
                        Button(action: {
                            store.dispatch(LoginViewStateAction.postLogin(state.credentials))
                            if state.loggedUser != nil {
                                store.dispatch(ActiveScreensStateAction.showScreen(.tabBar))
                            }
                        }
                        ) {
                            Text("Přihlásit se")
                                .frame(maxWidth: .infinity, maxHeight: 50)
                        }
                        .buttonStyle(ConfirmButtonStyle()).padding(-15)
                    }.padding(.bottom)
                }
                .disabled(state.isLoading)
            }
        }
        .padding()
        .preferredColorScheme(.dark)
        .onAppear(perform: {
            store.dispatch(ActiveScreensStateAction.showScreen(.loginView))
        })
        .onDisappear(perform: {
            store.dispatch(ActiveScreensStateAction.dismissScreen(.loginView))
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
