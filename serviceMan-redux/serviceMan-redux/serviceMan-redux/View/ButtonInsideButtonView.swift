//
//  ButtonInsideButtonView.swift
//  serviceMan-mvvm
//
//  Created by Pavel Odstrčilík on 20.04.2023.
//

import SwiftUI

struct ButtonInsideButtonView: View {
    @State var title: String
    @State var iconString: String
    var function: () -> Void

    var body: some View {
        ZStack(alignment: .trailing) {
            Button(action: {
                self.function()
            }) {
                HStack {
                    Text(title)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding()
                .background(Color.systemGray4)
                .cornerRadius(10.0)
            }
            Button(action: {
                self.function()
            }) {
                Circle()
                    .foregroundColor(Color.systemGray5)
                    .frame(width: 34.0)
                    .overlay(Image(systemName: iconString))
                    .padding()
                    .cornerRadius(15.0)
                    .padding()
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct ButtonInsideButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonInsideButtonView(title: "Pavel Odstrčilík", iconString: "phone.fill", function: {})
    }
}
