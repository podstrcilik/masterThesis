//
//  ServiceEventCompletionReducer.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 04.05.2023.
//

import Foundation

extension ServiceEventCompletionState {
    static let reducer: Reducer<Self> = { state, action in
        guard let action = action as? ServiceEventCompletionAction else { return state }
        switch action {
        case .postCompletion(let completion):
            return ServiceEventCompletionState(id: state.id, completion: completion, isLoading: true)
        case .updateDescriptionText(let text):
            var completion: ServiceEventCompletion?
            if let stateCompletion = state.completion {
                completion = ServiceEventCompletion(id: stateCompletion.id, serviceEventId: stateCompletion.serviceEventId, isCompleted: stateCompletion.isCompleted, note: text, selectedItemCompletionType: stateCompletion.selectedItemCompletionType, selectedImage: stateCompletion.selectedImage)
            }
            return ServiceEventCompletionState(id: state.id, completion: completion, isLoading: false)
        case .updateIsCompleted(let isCompleted):
            var completion: ServiceEventCompletion?
            if let stateCompletion = state.completion {
                completion = ServiceEventCompletion(id: stateCompletion.id, serviceEventId: stateCompletion.serviceEventId, isCompleted: isCompleted, note: stateCompletion.note, selectedItemCompletionType: stateCompletion.selectedItemCompletionType, selectedImage: stateCompletion.selectedImage)
            }
            return ServiceEventCompletionState(id: state.id, completion: completion, isLoading: false)
        case .updateCompletionType(let completionType):
            var completion: ServiceEventCompletion?
            if let stateCompletion = state.completion {
                completion = ServiceEventCompletion(id: stateCompletion.id, serviceEventId: stateCompletion.serviceEventId, isCompleted: stateCompletion.isCompleted, note: stateCompletion.note, selectedItemCompletionType: completionType, selectedImage: stateCompletion.selectedImage)
            }
            return ServiceEventCompletionState(id: state.id, completion: completion, isLoading: false)
        case .didSelectImage(let image):
            var completion: ServiceEventCompletion?
            if let stateCompletion = state.completion {
                var images = stateCompletion.selectedImage
                images.append(image)
                completion = ServiceEventCompletion(id: stateCompletion.id, serviceEventId: stateCompletion.serviceEventId, isCompleted: stateCompletion.isCompleted, note: stateCompletion.note, selectedItemCompletionType: stateCompletion.selectedItemCompletionType, selectedImage: images)
            }
            return ServiceEventCompletionState(id: state.id, completion: completion, isLoading: false)
        case .didFinishCompletion(let successfull):
            return ServiceEventCompletionState(id: state.id, completion: state.completion, isLoading: false)
        }
    }
}
