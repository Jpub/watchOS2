//
//  InterfaceController.swift
//  TipCalcApp WatchKit App Extension
//
//  Created by Neil Smyth on 8/18/15.
//  Copyright © 2015 eBookFrenzy. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var tipLabel: WKInterfaceLabel!
    @IBOutlet var amountLabel: WKInterfaceLabel!
    
    var currentAmount: Float = 0.00

    @IBAction func sliderChange(value: Float) {
        let amountString = String(format: "%0.2f", value)
        amountLabel.setText("$\(amountString)")
        currentAmount = value
    }
    
    @IBAction func calculateTip() {
        let tipAmount = currentAmount * 0.20
        let tipString = String(format: "%0.2f", tipAmount)
        tipLabel.setText("$\(tipString)")
        tipLabel.setHidden(false)
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        tipLabel.setHidden(true)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
