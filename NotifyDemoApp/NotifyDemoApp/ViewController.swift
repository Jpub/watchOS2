//
//  ViewController.swift
//  NotifyDemoApp
//
//  Created by Neil Smyth on 8/20/15.
//  Copyright © 2015 eBookFrenzy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let timeValue = 6.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonPress(sender: AnyObject) {
        setNotification()
    }
    
    func setNotification() {

        let localNotification:UILocalNotification =
                        UILocalNotification()

        localNotification.alertTitle = "Reminder"

        localNotification.alertBody = "Wake Up!"

        localNotification.fireDate = NSDate(timeIntervalSinceNow:
                            timeValue)
        localNotification.soundName =
                UILocalNotificationDefaultSoundName
        localNotification.category = "REMINDER_CATEGORY"

        UIApplication.sharedApplication().scheduleLocalNotification(
                    localNotification)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

