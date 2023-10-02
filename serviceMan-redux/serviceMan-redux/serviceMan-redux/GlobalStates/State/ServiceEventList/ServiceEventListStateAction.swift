//
//  ServiceEventListStateAction.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 01.05.2023.
//

import Foundation

enum ServiceEventListStateAction: Action {
    case fetchEvents
    case didReceiveEvents([ServiceEvent])
}
