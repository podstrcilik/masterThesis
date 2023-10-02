//
//  Customer.swift
//  serviceMan-mvvm
//
//  Created by Pavel Odstrčilík on 15.05.2023.
//

import Foundation

struct Customer {
    let id: String
    let name: String
    let address: String
    let contactName: String
    let telephoneContact: String
}

extension Customer {
    static let sampleData: Customer = Customer(id: "1", name: "Firma ABC s.r.o.", address: "Lísková 456, Vizovice", contactName: "Petr Novák", telephoneContact: "777 123 456")
}
