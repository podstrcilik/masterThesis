//
//  ServiceEventListMiddleware.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 01.05.2023.
//

import Foundation
import Combine

extension Middlewares {
    private static let serviceEventListRepository = ServiceEventListRepository()
    private static let serviceEventDetailRepository = ServiceEventDetailRepository()
    private static let customerDetailRepository = CustomerDetailRepository()

    static let eventList: Middleware<AppState> = { state, action in
        switch action {
        case ServiceEventListStateAction.fetchEvents:
            return serviceEventListRepository
                .fetchEvents()
                .map { ServiceEventListStateAction.didReceiveEvents($0) }
                .ignoreError()
                .eraseToAnyPublisher()
        case ServiceEventDetailAction.getServiceEvent(let id):
            return serviceEventDetailRepository
                .fetchEvent(id: id)
                .map { ServiceEventDetailAction.didReceiveEvent($0) }
                .ignoreError()
                .eraseToAnyPublisher()
        case CustomerDetailAction.getCustomer(let id):
            return customerDetailRepository
                .fetchCustomer(id: id)
                .map { CustomerDetailAction.didReceiveCustomer($0) }
                .ignoreError()
                .eraseToAnyPublisher()
        case ServiceEventCompletionAction.postCompletion(let completion):
            return serviceEventDetailRepository
                .postCompletion(completion)
                .map { _ in ServiceEventCompletionAction.didFinishCompletion(true) }
                .ignoreError()
                .eraseToAnyPublisher()
        default:
            return Empty().eraseToAnyPublisher()
        }
    }

}
