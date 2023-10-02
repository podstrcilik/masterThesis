//
//  TextWithBackground.swift
//  serviceMan-mvvm
//
//  Created by Pavel Odstrčilík on 20.04.2023.
//

import SwiftUI

struct TextWithBackground: View {
    @State var title: String
    @State var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 6.0) {
            Text(title)
                .font(.title3)
            Text(text)
        }
        .foregroundColor(.white)
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            alignment: .leading
        )
        .padding()
        .background(Color.systemGray4)
        .cornerRadius(10.0)
        .preferredColorScheme(.dark)
    }
}

struct TextWithBackground_Previews: PreviewProvider {
    static var previews: some View {
        TextWithBackground(title: "Description", text: "Very long long long long")
    }
}
