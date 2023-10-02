//
//  ServiceEventCompletionAction.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 04.05.2023.
//

import SwiftUI

enum ServiceEventCompletionAction: Action {
    case postCompletion(ServiceEventCompletion)
    case updateDescriptionText(String)
    case updateIsCompleted(Bool)
    case updateCompletionType(ServiceEventCompletionTypeEnum)
    case didSelectImage(UIImage)
    case didFinishCompletion(Bool)
}
