//
//  ServiceEventList.swift
//  serviceMan-mvvm
//
//  Created by Pavel Odstrčilík on 19.04.2023.
//

import SwiftUI

struct ServiceEventList: View {
    @StateObject var viewModel = ServiceEventListViewModel()

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Načítání")
                } else {
                    List(viewModel.events) { serviceEvent in
                        NavigationLink(destination: ServiceEventDetailView(serviceEvent: serviceEvent)) {
                            ServiceEventCellView(event: serviceEvent)
                                .listRowInsets(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
                                .listRowBackground(Color.clear)
                        }
                        .listRowSeparator(.hidden)
                    }
                    .refreshable {
                        viewModel.fetchData()
                    }
//                    .navigationBarTitle(Text("Servisní události"))
                    .listStyle(PlainListStyle())
                }
            }
            .navigationBarTitle(Text("Servisní události"))
        }
        .onAppear(perform: {
            viewModel.fetchData()
        })
        .environment(\.colorScheme, .dark)
    }
}

struct ServiceEventList_Previews: PreviewProvider {
    static var previews: some View {
        ServiceEventList(viewModel: ServiceEventListViewModel())
    }
}
