//
//  TextWithArrow.swift
//  serviceMan-mvvm
//
//  Created by Pavel Odstrčilík on 21.04.2023.
//

import SwiftUI

struct TextWithArrow: View {
    @State var title: String

    var body: some View {
        HStack {
            Text(title)
                .padding()
            Spacer()
            Image(systemName: "chevron.right")
                .frame(width: 50.0, height: 50.0)
                .foregroundColor(.white)
        }
        .background(Color.systemGray4)
        .cornerRadius(10.0)
        .preferredColorScheme(.dark)
    }
}

struct TextWithArrow_Previews: PreviewProvider {
    static var previews: some View {
        TextWithArrow(title: "Hello")
    }
}
