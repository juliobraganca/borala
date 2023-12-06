//
//  MapsVC.swift
//  borala
//
//  Created by Julio Braganca on 05/10/23.
//

import UIKit
import GoogleMaps

class MapsVC: UIViewController {

    var marker = GMSMarker()
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    override func loadView() {
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 10.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }
  
}

