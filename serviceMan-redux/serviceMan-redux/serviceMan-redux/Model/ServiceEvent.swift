//
//  ServiceEvent.swift
//  serviceMan-mvvm
//
//  Created by Pavel Odstrčilík on 19.04.2023.
//

import Foundation
import MapKit

struct ServiceEvent: Identifiable {
    let id: String
    let name: String
    let description: String
    let address: String
    let customer: Customer
    let date: Date
    let contactName: String
    let telephoneContact: String
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
}

extension ServiceEvent {
    static let sampleData: [ServiceEvent] =
    [
        ServiceEvent(id: "1", name: "Porucha stroje", description: "Stroj č. 5 se neustále zasekává a nedá se používat. Potřebovali bychom co nejdříve opravit.", address: "Třída Tomáše Bati 123, Zlín", customer: Customer(id: "1", name: "Firma ABC s.r.o.", address: "Vizovice", contactName: "Petr Novák", telephoneContact: "+420777123456", latitude: 49.23062, longitude: 17.6575), date: Date(), contactName: "Jan Novotný", telephoneContact: "602 555 666", latitude: 49.23062, longitude: 17.6575),
        ServiceEvent(id: "2", name: "Porucha v elektrické síti", description: "Ve výrobní hale vypadla elektrická síť a nedá se pokračovat v práci. Potřebovali bychom to co nejdříve vyřešit.", address: "U Fabriky 789, Kroměříž", customer: Customer(id: "2", name: "Firma XYZ a.s.", address: "Masarykovo náměstí 10, Kroměříž", contactName: "Anna Nováková", telephoneContact: "777 654 321", latitude: 49.23062, longitude: 17.6575), date: Date(), contactName: "Pavel Vávra", telephoneContact: "602 222 111", latitude: 10.0, longitude: 10.0),
        ServiceEvent(id: "3", name: "Revize výtahu", description: "Potřebovali bychom provést revizi výtahu v naší kancelářské budově. Výtah se nám zdá nestabilní a chceme zkontrolovat, zda vše funguje správně.", address: "Komenského náměstí 456, Uherské Hradiště", customer: Customer(id: "3", name: "Kanceláře s.r.o.", address: "Lipová 789, Uherské Hradiště", contactName: "Kateřina Nová", telephoneContact: "777 987 654", latitude: 49.23062, longitude: 17.6575), date: Date(), contactName: "Martin Vítek", telephoneContact: "604 111 222", latitude: 10.0, longitude: 10.0),
        ServiceEvent(
            id: "0007",
            name: "Revize strojů",
            description: "Zákazník nahlásil, že se blíží termín revize jejich zařízení. Chtějí, aby se na místě zkontroloval stav strojů a provedla revize.",
            address: "Ulice 9, Město",
            customer: Customer(id: "001", name: "Kovoservis s.r.o.", address: "Ulice 7, Město", contactName: "Jan Novák", telephoneContact: "+420 777 123 456", latitude: 49.23062, longitude: 17.6575),
            date: Date().addingTimeInterval(60*60*24*7),
            contactName: "Petr Vrána",
            telephoneContact: "+420 602 123 456", latitude: 10.0, longitude: 10.0
        ),
        ServiceEvent(
            id: "0008",
            name: "Porucha výrobní linky",
            description: "Zákazník nahlásil poruchu na výrobní lince, která způsobuje prodlevy v produkci. Problém se vyskytuje náhodně a nelze jej předem predikovat.",
            address: "Ulice 3, Město",
            customer: Customer(id: "002", name: "ZlínAutomotive a.s.", address: "Ulice 11, Město", contactName: "Kateřina Vrátilová", telephoneContact: "+420 605 123 456", latitude: 49.23062, longitude: 17.6575),
            date: Date().addingTimeInterval(60*60*24*3),
            contactName: "Jakub Němec",
            telephoneContact: "+420 602 789 123", latitude: 10.0, longitude: 10.0
        ),
        ServiceEvent(
            id: "0009",
            name: "Nová instalace",
            description: "Zákazník požaduje novou instalaci výrobní linky. Je třeba zajistit návrh a realizaci nového zařízení.",
            address: "Ulice 5, Město",
            customer: Customer(id: "003", name: "Nový průmysl s.r.o.", address: "Ulice 15, Město", contactName: "Lucie Nováková", telephoneContact: "+420 603 123 456", latitude: 49.23062, longitude: 17.6575),
            date: Date().addingTimeInterval(60*60*24*14),
            contactName: "Petr Vrána",
            telephoneContact: "+420 602 123 456", latitude: 10.0, longitude: 10.0
        )
    ]
}
