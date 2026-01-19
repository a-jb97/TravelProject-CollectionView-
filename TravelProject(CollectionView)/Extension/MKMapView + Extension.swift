//
//  MKMapView + Extension.swift
//  TravelProject(CollectionView)
//
//  Created by 전민돌 on 1/20/26.
//

import UIKit
import MapKit

extension MKMapView {
    func selectLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: location, span: span)
        
        self.setRegion(region, animated: true)
    }
    
    func setAnnotation(latitude: CLLocationDegrees, longitude: CLLocationDegrees, title: String) {
        let annotation = MKPointAnnotation()
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        annotation.coordinate = location
        annotation.title = title
        
        self.addAnnotation(annotation)
    }
}
