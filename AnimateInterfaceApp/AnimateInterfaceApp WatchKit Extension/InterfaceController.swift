//
//  InterfaceController.swift
//  AnimateInterfaceApp WatchKit Extension
//
//  Created by Neil Smyth on 8/19/15.
//  Copyright © 2015 eBookFrenzy. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var myGroup: WKInterfaceGroup!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    @IBAction func changeLayout() {
    self.animateWithDuration(3.0, animations: {

        self.myGroup.setRelativeWidth(0.7, withAdjustment: 0)
        self.myGroup.setRelativeHeight(0.5, withAdjustment: 0)
        self.myGroup.setHorizontalAlignment(.Right)
        self.myGroup.setVerticalAlignment(.Bottom)
        self.myGroup.setBackgroundColor(UIColor.redColor())
    })

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
