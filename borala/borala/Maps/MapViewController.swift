//
//  MapViewController.swift
//  borala
//
//  Created by Rober on 21/09/23.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    let mapView = MKMapView()
    let coordinate = CLLocationCoordinate2D(latitude: -22.988495, longitude: -43.192742)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        configureMap()
    }
}

extension MapViewController {
    private func configureMap() {
        view.addSubview(mapView)
        mapView.frame = view.bounds
        let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
        
        addPin()
    }
    
    private func addPin() {
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        pin.title = "Here you are"
        mapView.addAnnotations([pin])
    }
}
