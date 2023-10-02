//
//  MapWrapper.swift
//  serviceMan-mvvm
//
//  Created by Pavel Odstrčilík on 22.04.2023.
//

import SwiftUI
import MapKit

struct MapWrapper: View {
    @Binding var coordinateRegion: MKCoordinateRegion
    @State var markers = [Marker(location: MapMarker(coordinate: CLLocationCoordinate2D(latitude: -25.342863, longitude: 131.036974), tint: .blue))]

    var body: some View {
        let region = Binding (
            get: {
                self.coordinateRegion
            },
            set: { newValue in
                DispatchQueue.main.async {
                    self.coordinateRegion = newValue
                    markers = [Marker(location: MapMarker(coordinate: CLLocationCoordinate2D(latitude: coordinateRegion.center.latitude, longitude: coordinateRegion.center.longitude), tint: .darkRed))]
                }
            }
        )
        return Map(coordinateRegion: region, annotationItems: markers) { marker in
            marker.location }
    }
}

