//
//  AccountView.swift
//  serviceMan-mvvm
//
//  Created by Pavel Odstrčilík on 23.04.2023.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var user: User

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
                    {
                store.dispatch(ActiveScreensStateAction.showScreen(.loginView))
            }
            ) {
                Text("Odhlásit se")
                    .frame(maxWidth: .infinity, maxHeight: 50)
            }
            .buttonStyle(ConfirmButtonStyle()).padding(-15)
        }
        .padding()
        .preferredColorScheme(.dark)
        .onAppear(perform: {
            store.dispatch(ActiveScreensStateAction.showScreen(.accountView))
        })
        .onDisappear(perform: {
            store.dispatch(ActiveScreensStateAction.dismissScreen(.accountView))
        })
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
            .environmentObject(User.sampleData)
    }
}
