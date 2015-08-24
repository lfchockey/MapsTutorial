//
//  AnnotationMapVC.swift
//  MapsTutorial
//
//  Created by Mason Black on 2015-08-24.
//  Copyright (c) 2015 SFDCI. All rights reserved.
//

import UIKit
import MapKit // You also need to set the Projects=> Capabilities => Maps to 'On'


// This Map adds a clickable 'pin' that produces a pop-up (annotation)
class AnnotationMapVC: UIViewController{

    @IBOutlet weak var mapView: MKMapView!
    
    var regionRadius: CLLocationDistance = 1000 // Used to set the zoom level (radius) and is calculated in metres
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // sets the initial location of the centre of the map (i.e. SFDCI)
        let initialLocation = CLLocation(latitude: 44.882527, longitude: -76.011057)
        
        // calculates the region you'll look at on the screen (similar to a zoom level)
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate, regionRadius, regionRadius)
        
        
        // sets the region of the map
        mapView.setRegion(coordinateRegion, animated: true)
        
        
        
        // Add an annotation to the Map
        var newAnnotation = MKPointAnnotation()
        newAnnotation.coordinate = mapView.centerCoordinate
        newAnnotation.title = "SFDCI"
        newAnnotation.subtitle = "Home of the RedHawks"
        
        mapView.addAnnotation(newAnnotation)
    }

    
}
