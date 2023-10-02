//
//  CoordinatesMiddleware.swift
//  serviceMan-redux
//
//  Created by Pavel Odstrčilík on 03.05.2023.
//

import Foundation
import MapKit

final class CoordinatesMiddleware {
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
