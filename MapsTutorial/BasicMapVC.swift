//
//  Map1ViewController.swift
//  MapsTutorial
//
//  Created by SFDCI on 7/17/15.
//  Copyright (c) 2015 SFDCI. All rights reserved.
//

import UIKit
import MapKit // You also need to set the Projects=> Capabilities => Maps to 'On'

class BasicMapVC: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    
    let regionRadius: CLLocationDistance = 1000 // Used to set the zoom level (radius) and is calculated in metres
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // sets the initial location of the centre of the map (i.e. SFDCI)
        let initialLocation = CLLocation(latitude: 44.882527, longitude: -76.011057)
        
        // calculates the region you'll look at on the screen (similar to a zoom level)
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        
        
        // sets the region of the map
        mapView.setRegion(coordinateRegion, animated: true)
        
        //centerMapOnLocation(initialLocation)
    }

    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }

}
