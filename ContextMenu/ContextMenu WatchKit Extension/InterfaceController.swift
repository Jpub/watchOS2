//
//  InterfaceController.swift
//  ContextMenu WatchKit Extension
//
//  Created by Neil Smyth on 8/19/15.
//  Copyright © 2015 eBookFrenzy. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var statusLabel: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

        @IBAction func playSelected() {
            statusLabel.setText("Play")
        }

        @IBAction func pauseSelected() {
            statusLabel.setText("Pause")
        }

        @IBAction func stopSelected() {
            statusLabel.setText("Stop")
        }

        @IBAction func shuffleSelected() {
            statusLabel.setText("Shuffle")
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
