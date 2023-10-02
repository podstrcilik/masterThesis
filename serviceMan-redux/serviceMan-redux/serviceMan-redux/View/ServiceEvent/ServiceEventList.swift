//
//  ServiceEventList.swift
//  serviceMan-mvvm
//
//  Created by Pavel Odstrčilík on 19.04.2023.
//

import SwiftUI

struct ServiceEventList: View {
    @EnvironmentObject var store: Store<AppState>
    var state: ServiceEventListState? {
        store.state.screenState(for: .serviceEventList)
    }

    var body: some View {
        NavigationView {
            Group {
                if let state {
                    if state.isLoading {
                        ProgressView("Načítání")
                    } else {
                        List(state.serviceEvents) { serviceEvent in
                            NavigationLink(destination: ServiceEventDetailView(eventId: serviceEvent.id)){
                                ServiceEventCellView(event: serviceEvent)
                                    .listRowInsets(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
                                    .listRowBackground(Color.clear)
                            }
                        }
                        .refreshable {
                            store.dispatch(ServiceEventListStateAction.fetchEvents)
                        }
                        .listStyle(PlainListStyle())
                    }
                }
            }
            .navigationBarTitle(Text("Servisní události"))
        }
        .onAppear(perform: {
            store.dispatch(ActiveScreensStateAction.showScreen(.serviceEventList))
            store.dispatch(ServiceEventListStateAction.fetchEvents)
        })
        .onDisappear(perform: {
            store.dispatch(ActiveScreensStateAction.dismissScreen(.serviceEventList))
        })
        .environment(\.colorScheme, .dark)
    }
}

struct ServiceEventList_Previews: PreviewProvider {
    static var previews: some View {
        ServiceEventList()
    }
}
