//
//  PolygonOverlayVC.swift
//  MapsTutorial
//
//  Created by Mason Black on 2015-08-24.
//  Copyright (c) 2015 SFDCI. All rights reserved.
//

import UIKit
import MapKit

class PolygonOverlayVC: UIViewController, MKMapViewDelegate {

    var regionRadius: CLLocationDistance = 1000 // Used to set the zoom level (radius) and is calculated in metres
    
    @IBOutlet weak var mapView: MKMapView!
    
    var school = SFDCI(filename: "SFDCIPolygon")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // sets the initial location of the centre of the map (i.e. SFDCI)
        let initialLocation = CLLocation(latitude: 44.882527, longitude: -76.011057)
        
        // calculates the region you'll look at on the screen (similar to a zoom level)
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate, regionRadius, regionRadius)
        
        
        // sets the region of the map
        mapView.setRegion(coordinateRegion, animated: true)
        
        addBoundary()

    }

    func addBoundary() {
        let polygon = MKPolygon(coordinates: &school.boundary, count: school.boundaryPointsCount)
        mapView.addOverlay(polygon)
    }
    
    
    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
        if overlay is MKPolygon {
            let polygonView = MKPolygonRenderer(overlay: overlay)
            polygonView.strokeColor = UIColor.blackColor()
            
            return polygonView
        }
        
        return nil
    }
    
}
