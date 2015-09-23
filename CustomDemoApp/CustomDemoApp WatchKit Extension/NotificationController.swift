//
//  NotificationController.swift
//  CustomDemoApp WatchKit Extension
//
//  Created by Neil Smyth on 8/20/15.
//  Copyright © 2015 eBookFrenzy. All rights reserved.
//

import WatchKit
import Foundation


class NotificationController: WKUserNotificationInterfaceController {

    @IBOutlet var notificationAlertLabel: WKInterfaceLabel!
    @IBOutlet var notificationImage: WKInterfaceImage!
    
    override init() {
        // Initialize variables here.
        super.init()
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    
    override func didReceiveLocalNotification(localNotification: UILocalNotification, withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
        print("didReceiveLocal")
        if localNotification.alertTitle == "Rain" {
            notificationAlertLabel.setText("Rain")
            notificationImage.setImageNamed("rain_image")
        }

        if localNotification.alertTitle == "Snow" {
            notificationAlertLabel.setText("Snow")
            notificationImage.setImageNamed("snow_image")
        }

        completionHandler(.Custom)
    }
    
    
    /*
    override func didReceiveRemoteNotification(remoteNotification: [NSObject : AnyObject], withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
        // This method is called when a remote notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        //
        // After populating your dynamic notification interface call the completion block.
        completionHandler(.Custom)
    }
    */
}
