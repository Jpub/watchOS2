//
//  InterfaceController.swift
//  TextInputApp WatchKit Extension
//
//  Created by Neil Smyth on 8/19/15.
//  Copyright © 2015 eBookFrenzy. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var labelObject: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    @IBAction func getUserInput() {
        
        let phrases = ["I'm in a meeting", "I'll call you later", "Call me later"]

        presentTextInputControllerWithSuggestions(phrases,
                    allowedInputMode: .AllowEmoji,
                    completion: { (result) -> Void in
                        
            if let choice = result {
                self.labelObject.setText(choice[0] as? String)
            }
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
