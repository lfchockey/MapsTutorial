//
//  PolyLineMapVC.swift
//  MapsTutorial
//
//  Created by Mason Black on 2015-08-25.
//  Copyright (c) 2015 SFDCI. All rights reserved.
//

import UIKit
import MapKit

// This Map displays a Polyline of three connected dots
class PolyLineMapVC: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var pointsToUse: [CLLocationCoordinate2D] = []
    var regionRadius: CLLocationDistance = 1000 // Used to set the zoom level (radius) and is calculated in metres
    var myPolyine: MKPolyline = MKPolyline()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // sets the initial location of the centre of the map (i.e. SFDCI)
        let initialLocation = CLLocation(latitude: 44.882527, longitude: -76.011057)
        
        // calculates the region you'll look at on the screen (similar to a zoom level)
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate, regionRadius, regionRadius)
        
        
        // sets the region of the map
        mapView.setRegion(coordinateRegion, animated: true)
        
        
        //  Add four latitude/longitude points to the array
        pointsToUse += [CLLocationCoordinate2DMake(44.882527, -76.011057)]
        pointsToUse += [CLLocationCoordinate2DMake(44.88376, -76.013471)]
        pointsToUse += [CLLocationCoordinate2DMake(44.883867, -76.008557)]
        pointsToUse += [CLLocationCoordinate2DMake(44.881305, -76.011776)]
        
        // Make a Polyline from the points
        myPolyine = MKPolyline(coordinates: &pointsToUse, count: pointsToUse.count)
        
        // Add the Overlay to the Map (which calls the function below)
        mapView.addOverlay(myPolyine)
    }
    
    // This function displays the Polyline on the Map.
    //      Notice you can also change some properties of the line (colour, width)
    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
        if overlay is MKPolyline {
            let polylineView = MKPolylineRenderer(overlay: overlay)
            polylineView.strokeColor = UIColor.blackColor()
            polylineView.lineWidth = 1
            
            return polylineView
        }
        
        return nil

    }

    
}
