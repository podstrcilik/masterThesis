//
//  PhoneProtocol.swift
//  serviceMan-mvvm
//
//  Created by Pavel Odstrčilík on 27.04.2023.
//

import Foundation
import UIKit

public protocol PhoneProtocol {
    func callToNumber(_ number: String)
}

public extension PhoneProtocol {
    func callToNumber(_ number: String) {
        guard let url = URL(string: "tel://\(number)"),
              UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
