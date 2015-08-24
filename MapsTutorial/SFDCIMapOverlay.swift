//
//  SFDCIMapOverlay.swift
//  MapsTutorial
//
//  Created by Mason Black on 2015-08-24.
//  Copyright (c) 2015 SFDCI. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class SFDCIMapOverlay: NSObject, MKOverlay {
    var coordinate: CLLocationCoordinate2D
    var boundingMapRect: MKMapRect
    
    init(school: SFDCI) {
        boundingMapRect = school.overlayBoundingMapRect
        coordinate = school.midCoordinate
    }
}
