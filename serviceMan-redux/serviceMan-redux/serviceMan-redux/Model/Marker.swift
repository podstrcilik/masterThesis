//
//  Marker.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 08.05.2023.
//

import SwiftUI
import MapKit

struct Marker: Identifiable {
    let id = UUID()
    var location: MapMarker
}
