//
//  SFDCIMapOverlayView.swift
//  MapsTutorial
//
//  Created by Mason Black on 2015-08-24.
//  Copyright (c) 2015 SFDCI. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class SFDCIMapOverlayView: MKOverlayRenderer {
    var overlayImage: UIImage
    
    init(overlay:MKOverlay, overlayImage:UIImage) {
        self.overlayImage = overlayImage
        super.init(overlay: overlay)
    }
    
    override func drawMapRect(mapRect: MKMapRect, zoomScale: MKZoomScale, inContext context: CGContext!) {
        let imageReference = overlayImage.CGImage
        
        let theMapRect = overlay.boundingMapRect
        let theRect = rectForMapRect(theMapRect)
        
        CGContextScaleCTM(context, 1.0, -1.0)
        CGContextTranslateCTM(context, 0.0, -theRect.size.height)
        CGContextDrawImage(context, theRect, imageReference)
    }
}