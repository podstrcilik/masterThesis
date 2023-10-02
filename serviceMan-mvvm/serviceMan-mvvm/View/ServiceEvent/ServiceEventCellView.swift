//
//  ServiceEventCellView.swift
//  serviceMan-mvvm
//
//  Created by Pavel Odstrčilík on 19.04.2023.
//

import SwiftUI

struct ServiceEventCellView: View {
    @State var event: ServiceEvent

    var body: some View {
        HStack {
            Rectangle()
                .foregroundColor(.darkRed)
                .frame(width: 70,height: 70)
                .cornerRadius(5)
                .overlay(
                    Text(event.date, formatter: DateFormatter.shortDayMonth)
                        .foregroundColor(.white)
                        .font(.title2)
                )
                .padding()
//            Spacer()
            VStack (alignment: .leading, spacing: 5) {
                Text(event.name)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(1)
                Label(event.address, systemImage: "mappin")
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Label(event.customer.name, systemImage: "person")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(1)
//                              .font(.headline)
            }
            .padding()
            .foregroundColor(.white)
//            .toolbar(.hidden, for: .tabBar)
        }
        .frame(maxWidth: .infinity)
        .background(Color(.darkGray))
        .cornerRadius(5)
        .preferredColorScheme(.dark)
    }
}

struct ServiceEventCellView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ServiceEventCellView(event: ServiceEvent.sampleData[0])
            ServiceEventCellView(event: ServiceEvent.sampleData[3])
            ServiceEventCellView(event: ServiceEvent.sampleData[2])
        }
    }
}
