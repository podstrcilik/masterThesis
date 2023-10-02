//
//  AccountView.swift
//  serviceMan-mvvm
//
//  Created by Pavel Odstrčilík on 23.04.2023.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var user: User
    @Binding var isLogged: Bool

    var body: some View {
        VStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 80, height: 80).padding()
            Text("\(user.firstName) \(user.lastName)")
                .font(.title)
            TextWithBackground(title: "Přezdívka", text: user.username)
            Spacer()
            Button(action:
                    { isLogged = false }
            ) {
                Text("Odhlásit se")
                    .frame(maxWidth: .infinity, maxHeight: 50)
            }
            .buttonStyle(ConfirmButtonStyle()).padding(-15)
        }
        .padding()
        .preferredColorScheme(.dark)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(isLogged: .constant(true))
            .environmentObject(User.sampleData)
    }
}
