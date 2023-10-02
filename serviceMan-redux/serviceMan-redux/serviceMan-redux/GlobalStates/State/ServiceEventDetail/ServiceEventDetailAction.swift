//
//  ServiceEventDetailAction.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 01.05.2023.
//

import Foundation

enum ServiceEventDetailAction: Action {
    case getServiceEvent(id: String)
    case didReceiveEvent(ServiceEvent)
    case openAppleMaps(ServiceEvent)
    case callToNumber(ServiceEvent)
}
