//
//  InterfaceController.swift
//  PageDemoApp WatchKit Extension
//
//  Created by Neil Smyth on 8/19/15.
//  Copyright © 2015 eBookFrenzy. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
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

    override func contextForSegueWithIdentifier(segueIdentifier: String) -> AnyObject? {

        var contextValue: NSTimeInterval?

        switch (segueIdentifier) {
            case "walkSegue":
                contextValue = 10
            case "runSegue":
                contextValue = 20
            case "weightsSegue":
                contextValue = 30
            default:
                break
        }
        return(contextValue)
    }

}
