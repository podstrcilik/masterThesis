//
//  ServiceEventCompletion.swift
//  serviceMan-mvvm
//
//  Created by Pavel Odstrčilík on 22.04.2023.
//

import Foundation

struct ServiceEventCompletion: Identifiable {
    let id: String
    var serviceEventId: String
    var isCompleted: Bool
    var note: String
    var selectedItemCompletionType: ServiceEventCompletionTypeEnum
}

