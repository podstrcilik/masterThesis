//
//  PhoneMiddleware.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 03.05.2023.
//

import Foundation
import UIKit

final class PhoneMiddleware {
    func callToNumber(_ number: String) {
        guard let url = URL(string: "tel://\(number)"),
              UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
