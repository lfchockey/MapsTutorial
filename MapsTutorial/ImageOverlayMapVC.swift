//
//  PolygonMapVC.swift
//  MapsTutorial
//
//  Created by Mason Black on 2015-08-24.
//  Copyright (c) 2015 SFDCI. All rights reserved.
//

import UIKit
import MapKit

// Here are the steps for making an Overlay Image show up on the Map
//      1. Add a new View Controller with a Map View to your StoryBoard
//      2. Create (New File...) a UIViewController Swift class ('ImageOverlayMapVC')
//      3. import MapKit
//      4. Inherit from MKMapViewDelegate (in the 1st line of the class declaration)
//      5. In the StoryBoard, set the Custom Class of the View Controller to be the same as Step 2
//      6. In the StoryBoard, right-click and drag the Map View and set it as the delegate of the View Controller
//      7. From StoryBoard to View Controller class, create an IBOutlet for your Map View
//      8. Create a plist with all of your coordinates in it
//      9. Create (New File...) a Model Swift class ('SFDCICoordinates.swift') that pulls the data from the plist and stores in an object (variables)
//      10. Create (New File...) your own Swift class ('SFDCIMapOverlay.swift') that implements the MKOverlay protocol
//      11. Create (New File...) your own Swift class ('SFDCIMapOverlayView.swift') that implements the MKOverlayRenderer
//      12. Code the addOverlay() function (which calls the mapView - rendererForOverlay function)
//      13. Create the mapView - rendererForOverlay function which places the Overlay on the Map


// This Map reads data from 'SFDCIPolygon.plist' with a helper class (SFDCICoordinates.swift)
//      It takes this data and then builds a Polygon based on the coordinates stored in the plist.
class ImageOverlayMapVC: UIViewController, MKMapViewDelegate {

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
        
        
//        let latDelta = school.overlayTopLeftCoordinate.latitude - school.overlayBottomRightCoordinate.latitude
//        
//        // think of a span as a tv size, measure from one corner to another
//        let span = MKCoordinateSpanMake(fabs(latDelta), 0.0)
//        
//        let region = MKCoordinateRegionMake(school.midCoordinate, span)
//        
//        mapView.region = region
        
        addOverlay()
        
    }


    func addOverlay() {
        let overlay = SFDCIMapOverlay(school: school)
        mapView.addOverlay(overlay)
    }
    
    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
        if overlay is SFDCIMapOverlay {
            let magicMountainImage = UIImage(named: "redhawk")
            let overlayView = SFDCIMapOverlayView(overlay: overlay, overlayImage: magicMountainImage!)
            
            return overlayView
        } 
        
        return nil
    }

}
