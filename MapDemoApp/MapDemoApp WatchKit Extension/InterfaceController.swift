//
//  InterfaceController.swift
//  MapDemoApp WatchKit Extension
//
//  Created by Neil Smyth on 8/20/15.
//  Copyright © 2015 eBookFrenzy. All rights reserved.
//

import WatchKit
import Foundation
import CoreLocation

class InterfaceController: WKInterfaceController, CLLocationManagerDelegate {

    @IBOutlet var mapObject: WKInterfaceMap!
    var locationManager: CLLocationManager = CLLocationManager()
    var mapLocation: CLLocationCoordinate2D?

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestLocation()
    }

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let currentLocation = locations[0]
        let lat = currentLocation.coordinate.latitude
        let long = currentLocation.coordinate.longitude

        self.mapLocation = CLLocationCoordinate2DMake(lat, long)

        let span = MKCoordinateSpanMake(0.1, 0.1)

        let region = MKCoordinateRegionMake(self.mapLocation!, span)
        self.mapObject.setRegion(region)

        self.mapObject.addAnnotation(self.mapLocation!, 
                withPinColor: .Red)
    }

    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {

        print(error.description)
    }


    @IBAction func changeMapRegion(value: Float) {
    let degrees:CLLocationDegrees = CLLocationDegrees(value / 10)

    let span = MKCoordinateSpanMake(degrees, degrees)
    let region = MKCoordinateRegionMake(mapLocation!, span)

    mapObject.setRegion(region)

    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
