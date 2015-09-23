//
//  GlanceController.swift
//  TableDemoApp
//
//  Created by Neil Smyth on 8/19/15.
//  Copyright © 2015 eBookFrenzy. All rights reserved.
//

import WatchKit
import Foundation


class GlanceController: WKInterfaceController {

    @IBOutlet var titleLabel: WKInterfaceLabel!
    @IBOutlet var mainLabel: WKInterfaceLabel!
    
    let titleData = ["Warm-up", "Cardio", "Weightlifting", "Core", "Bike", "Cooldown"]
    let durationData = ["20 mins", "30 mins", "3 x 10", "2 x 20", "20 mins", "20 mins"]

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        super.willActivate()
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let index: Int? = userDefaults.integerForKey("index")

        if let arrayIndex = index {
            titleLabel.setText(titleData[arrayIndex - 1])
            mainLabel.setText(durationData[arrayIndex - 1])
            updateUserActivity("com.example.TableDemoApp",
            userInfo: ["controller": arrayIndex], webpageURL: nil)
        }

    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
