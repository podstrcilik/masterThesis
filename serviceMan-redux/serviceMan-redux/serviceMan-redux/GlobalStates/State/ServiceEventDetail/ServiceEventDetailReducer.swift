//
//  ServiceEventReducer.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 01.05.2023.
//

import Foundation

extension ServiceEventDetailState {
    static let reducer: Reducer<Self> = { state, action in
        guard let action = action as? ServiceEventDetailAction else { return state }
        switch action {
        case .getServiceEvent(let id):
            return ServiceEventDetailState(id: id,
                                           serviceEvent: nil)
        case .didReceiveEvent(let event):
            return ServiceEventDetailState(id: event.id,
                                           serviceEvent: event)
        case .openAppleMaps(let event):
            return ServiceEventDetailState(id: event.id,
                                           serviceEvent: event)
        case .callToNumber(let event):
            return ServiceEventDetailState(id: event.id,
                                           serviceEvent: event)
        }
    }
}
