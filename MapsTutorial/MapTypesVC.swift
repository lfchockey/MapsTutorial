//
//  MapTypesVC.swift
//  MapsTutorial
//
//  Created by SFDCI on 7/17/15.
//  Copyright (c) 2015 SFDCI. All rights reserved.
//

import UIKit
import MapKit

class MapTypesVC: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var mapsSegCtrl: UISegmentedControl!
    
    @IBAction func mapTypeChanged(sender: AnyObject) {
        let mapType = mapsSegCtrl.selectedSegmentIndex
        switch (mapType) {
        case 0:
            mapView.mapType = MKMapType.Standard
        case 1:
            mapView.mapType = MKMapType.Hybrid
        case 2:
            mapView.mapType = MKMapType.Satellite
        default:
            mapView.mapType = MKMapType.Standard
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Used to set the zoom level (radius) and is calculated in metres
        let regionRadius: CLLocationDistance = 1000
        
        // sets the initial location of the centre of the map (i.e. SFDCI)
        let initialLocation = CLLocation(latitude: 44.882527, longitude: -76.011057)
        
        // calculates the region you'll look at on the screen (similar to a zoom level)
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        
        
        // sets the region of the map
        mapView.setRegion(coordinateRegion, animated: true)
    }

    

}
