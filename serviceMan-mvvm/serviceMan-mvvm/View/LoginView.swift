//
//  LoginView.swift
//  serviceMan-mvvm
//
//  Created by Pavel Odstrčilík on 19.04.2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel
    
    var body: some View {
        ZStack {
            if viewModel.isLoading {
                ProgressView("Přihlašování...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
                    .background(Color.systemGray)
                    .cornerRadius(10)
                    .zIndex(1)
            }
            VStack{
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
                            text: $viewModel.credentials.name
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
                            text: $viewModel.credentials.password
                        )
                        .padding()
                        .background(Color.systemGray5)
                        .cornerRadius(5.0)
                    }.padding()
                    Button(action:
                            viewModel.logIn
                    ) {
                        Text("Přihlásit se")
                            .frame(maxWidth: .infinity, maxHeight: 50)
                    }
                    .buttonStyle(ConfirmButtonStyle()).padding(-15)
                    
                }
                .padding(.bottom)
            }
            .padding()
            .preferredColorScheme(.dark)
        }
        .disabled(viewModel.isLoading)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel())
    }
}
