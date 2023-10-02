//
//  Customer.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 08.05.2023.
//

import MapKit

struct Customer {
    let id: String
    let name: String
    let address: String
    let contactName: String
    let telephoneContact: String
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
}

extension Customer {
    static let sampleData: Customer = Customer(id: "1", name: "Firma ABC s.r.o.", address: "Lísková 456, Vizovice", contactName: "Petr Novák", telephoneContact: "777 123 456", latitude: 49.23062, longitude: 17.6575)
}
