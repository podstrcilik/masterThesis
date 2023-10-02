//
//  Date+shortDayMonth.swift
//  serviceMan-mvvm
//
//  Created by Pavel Odstrčilík on 21.04.2023.
//

import Foundation

extension DateFormatter {
    static let shortDayMonth: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d.M."
        return formatter
    }()
}
