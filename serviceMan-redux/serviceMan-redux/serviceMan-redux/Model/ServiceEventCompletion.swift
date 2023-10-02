//
//  ServiceEventCompletion.swift
//  serviceMan-mvvm
//
//  Created by Pavel Odstrčilík on 22.04.2023.
//

import SwiftUI

struct ServiceEventCompletion: Identifiable {
    let id: String
    var serviceEventId: String
    var isCompleted: Bool
    var note: String
    var selectedItemCompletionType: ServiceEventCompletionTypeEnum
    var selectedImage: [UIImage]
}
