//
//  ZoomMapVC.swift
//  MapsTutorial
//
//  Created by Mason Black on 2015-08-24.
//  Copyright (c) 2015 SFDCI. All rights reserved.
//

import UIKit
import MapKit

class ZoomMapVC: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var regionRadius: CLLocationDistance = 1000 // Used to set the zoom level (radius) and is calculated in metres
    
    
    // Initial function to set up Map
    override func viewDidLoad() {
        super.viewDidLoad()

        // sets the initial location of the centre of the map (i.e. SFDCI)
        let initialLocation = CLLocation(latitude: 44.882527, longitude: -76.011057)
        
        // calculates the region you'll look at on the screen (similar to a zoom level)
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate, regionRadius, regionRadius)
        
        
        // sets the region of the map
        mapView.setRegion(coordinateRegion, animated: true)
        
        
    }
    
    
    
    // This function cuts the regionRadius in half
    @IBAction func zoomIn(sender: AnyObject) {
        regionRadius = regionRadius * 0.5
        centerMapOnLocation()
    }
    
    // This function doubles the regionRadius
    @IBAction func zoomOut(sender: AnyObject) {
        regionRadius = regionRadius * 2.0
        centerMapOnLocation()
    }

    
    
    // This function is used to set a new zoom level (setRegion) based on the parameters passed to the function
    func centerMapOnLocation() {
        
        // Find the new center of the Map in case it has been moved
        let newCenter = mapView.centerCoordinate
        
        // Calculate the new region to zoom to
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(newCenter, regionRadius, regionRadius)
        
        mapView.setRegion(coordinateRegion, animated: true)
    }
}
