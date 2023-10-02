//
//  ServiceEventCompletionTypeEnum.swift
//  serviceMan-mvvm
//
//  Created by Pavel Odstrčilík on 23.04.2023.
//

import Foundation

enum ServiceEventCompletionTypeEnum: String, CaseIterable {
    case repaired = "Oprava"
    case newPiece = "Nový kus"
    case other = "Ostatní"
}
