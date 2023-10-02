//
//  MainTabView.swift
//  serviceMan-mvvm
//
//  Created by Pavel Odstrčilík on 21.04.2023.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var loggedUser: User

    var body: some View {
        TabView {
            ServiceEventList()
                .tabItem {
                    Label("Úkoly", systemImage: "checklist")
                }
            AccountView()
                .tabItem {
                    Label("Účet", systemImage: "person")
                }
                .environmentObject(loggedUser)

        }
        .preferredColorScheme(.dark)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
