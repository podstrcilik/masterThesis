//
//  ConfirmButtonStyle.swift
//  serviceMan-mvvm
//
//  Created by Pavel Odstrčilík on 19.04.2023.
//

import SwiftUI

struct ConfirmButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
           configuration.label
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(5)
            .padding()
       }
}

struct BaseButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button("Button") {}
        .buttonStyle(ConfirmButtonStyle())

    }
}
