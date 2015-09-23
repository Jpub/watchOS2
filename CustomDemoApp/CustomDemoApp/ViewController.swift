//
//  ViewController.swift
//  CustomDemoApp
//
//  Created by Neil Smyth on 8/20/15.
//  Copyright © 2015 eBookFrenzy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let app = UIApplication.sharedApplication()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func rainAlert(sender: AnyObject) {
        let alertTime = NSDate().dateByAddingTimeInterval(5)

        let notifyAlarm = UILocalNotification()

        notifyAlarm.fireDate = alertTime
        notifyAlarm.timeZone = NSTimeZone.defaultTimeZone()
        notifyAlarm.soundName = UILocalNotificationDefaultSoundName
        notifyAlarm.category = "WEATHER_CATEGORY"
        notifyAlarm.alertTitle = "Rain"
        notifyAlarm.alertBody = "It is going to rain"
        app.scheduleLocalNotification(notifyAlarm)
    }
    
    @IBAction func snowAlert(sender: AnyObject) {
        let alertTime = NSDate().dateByAddingTimeInterval(5)

        let notifyAlarm = UILocalNotification()

        notifyAlarm.fireDate = alertTime
        notifyAlarm.timeZone = NSTimeZone.defaultTimeZone()
        notifyAlarm.soundName = UILocalNotificationDefaultSoundName
        notifyAlarm.category = "WEATHER_CATEGORY"
        notifyAlarm.alertTitle = "Snow"
        notifyAlarm.alertBody = "It is going to snow"
        app.scheduleLocalNotification(notifyAlarm)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

