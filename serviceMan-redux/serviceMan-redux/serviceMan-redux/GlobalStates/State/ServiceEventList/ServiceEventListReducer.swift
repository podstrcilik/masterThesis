//
//  ServiceEventListReducer.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 01.05.2023.
//

import Foundation

extension ServiceEventListState {
    static let reducer: Reducer<Self> = { state, action in
        switch action {
        case ServiceEventListStateAction.fetchEvents:
            return ServiceEventListState(
                serviceEvents: [],
                isLoading: true
            )
        case ServiceEventListStateAction.didReceiveEvents(let events):
            return ServiceEventListState(
                serviceEvents: events,
                isLoading: false
            )
        default:
            return state
        }
    }
}
