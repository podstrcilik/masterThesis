//
//  Reducer.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 17.05.2023.
//

import Foundation

typealias Reducer<State> = (State, Action) -> State
