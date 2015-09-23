//
//  TimerInterfaceController.swift
//  PageDemoApp
//
//  Created by Neil Smyth on 8/19/15.
//  Copyright © 2015 eBookFrenzy. All rights reserved.
//

import WatchKit
import Foundation


class TimerInterfaceController: WKInterfaceController {

    @IBOutlet var workoutTimer: WKInterfaceTimer!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        if let duration: AnyObject = context {

            NSTimer.scheduledTimerWithTimeInterval(
            duration as! NSTimeInterval, 
            target: self, 
            selector: Selector("playAlert"), 
            userInfo: nil, 
            repeats: false)

            let date = NSDate(timeIntervalSinceNow: 
                    duration as! NSTimeInterval)
            workoutTimer.setDate(date)
            workoutTimer.start()
        }
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    func playAlert() {
        let device = WKInterfaceDevice.currentDevice()
        device.playHaptic(.Notification)
    }


}
