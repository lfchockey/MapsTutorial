//
//  AnnotateImageVC.swift
//  MapsTutorial
//
//  Created by Mason Black on 2015-08-24.
//  Copyright (c) 2015 SFDCI. All rights reserved.
//

import UIKit
import MapKit // You also need to set the Projects=> Capabilities => Maps to 'On'


//**** TIPS
// You must add the MKMapViewDelegate to the class
// You must right-click and drag from your Map (in the storyboard), to the File's Owner (yellow cube) to set it as the delegate

// The following uses a helper class (CustomPointAnnotation) to add an image to the Annotation
class AnnotateImageVC: UIViewController, MKMapViewDelegate {

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
        var newAnnotation = CustomPointAnnotation()
        newAnnotation.coordinate = mapView.centerCoordinate
        newAnnotation.title = "SFDCI"
        newAnnotation.subtitle = "Home of the RedHawks"
        newAnnotation.imageName = "redhawk"
        
        mapView.addAnnotation(newAnnotation)
    }
    
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        println("delegate called")
        if (annotation is MKUserLocation) {
            //if annotation is not an MKPointAnnotation (eg. MKUserLocation),
            //return nil so map draws default view for it (eg. blue dot)...
            return nil
        }
        
        let reuseId = "test"
        
        var anView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId)
        if anView == nil {
            anView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            anView.image = UIImage(named:"redhawk")
            anView.canShowCallout = true
        }
        else {
            //we are re-using a view, update its annotation reference...
            anView.annotation = annotation
        }
        
        return anView
    }
    


}

class CustomPointAnnotation: MKPointAnnotation {
    var imageName: String!
}
