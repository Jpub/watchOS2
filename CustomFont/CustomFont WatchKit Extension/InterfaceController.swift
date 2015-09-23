//
//  InterfaceController.swift
//  CustomFont WatchKit Extension
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
        
    if let customFont = UIFont(name: 
		"Sofia-Regular", size: 22) {
        let fontAttributes = [NSFontAttributeName : customFont]

        let attributedText = NSAttributedString(string: "Apple Watch",
               attributes: fontAttributes)

        labelObject.setAttributedText(attributedText)
    } else {
         print("Font not found")
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

}
