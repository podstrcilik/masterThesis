//
//  CoordinatesProtocol.swift
//  serviceMan-mvvm
//
//  Created by Pavel Odstrčilík on 27.04.2023.
//

import SwiftUI
import MapKit

public protocol CoordinatesProtocol {
    func getCoordinatesFromAddress(_ address: String, completion: @escaping (MKCoordinateRegion?) -> Void)
    func openAppleMaps(region: MKCoordinateRegion, name: String)
}

extension CoordinatesProtocol {
    func getCoordinatesFromAddress(_ address: String, completion: @escaping (MKCoordinateRegion?) -> Void) {
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(address) { (placemarks, error) in
            guard
                let placemarks = placemarks,
                let location = placemarks.first?.location?.coordinate
            else {
                // handle no location found
                completion(nil)
                return
            }
            print(location.latitude)
            print(location.longitude)

            let newRegion = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: location.latitude,
                                               longitude: location.longitude),
                latitudinalMeters: 750,
                longitudinalMeters: 750
            )

            DispatchQueue.main.async {
                completion(newRegion)
            }
        }
    }

    func openAppleMaps(region: MKCoordinateRegion, name: String) {
        let locationDistance = 5000.0
        let locationCoordinates = CLLocationCoordinate2DMake(region.center.latitude, region.center.longitude)
        let coordinateRegion = MKCoordinateRegion(center: locationCoordinates, latitudinalMeters: locationDistance, longitudinalMeters: locationDistance)
        let launchOptions = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: coordinateRegion.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: coordinateRegion.span)
        ]
        let placemark = MKPlacemark(coordinate: locationCoordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = name
        mapItem.openInMaps(launchOptions: launchOptions)
    }
}
