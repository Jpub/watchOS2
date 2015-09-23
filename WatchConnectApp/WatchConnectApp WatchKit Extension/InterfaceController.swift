//
//  InterfaceController.swift
//  WatchConnectApp WatchKit Extension
//
//  Created by Neil Smyth on 8/19/15.
//  Copyright © 2015 eBookFrenzy. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController {

    @IBOutlet var statusLabel: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    @IBAction func startPlay() {
        if WCSession.defaultSession().reachable == true {

            let requestValues = ["command" : "start"]
            let session = WCSession.defaultSession()
                
            session.sendMessage(requestValues, replyHandler: { reply in
                self.statusLabel.setText(reply["status"] as? String)
                }, errorHandler: { error in
                    print("error: \(error)")
            })
        }

    }
    
    @IBAction func stopPlay() {
        if WCSession.defaultSession().reachable == true {

            let requestValues = ["command" : "stop"]
            let session = WCSession.defaultSession()
                
            session.sendMessage(requestValues, replyHandler: { reply in
                self.statusLabel.setText(reply["status"] as? String)
                }, errorHandler: { error in
                    print("error: \(error)")
            })
        }

    }
    
    @IBAction func volumeChange(value: Float) {
        let requestValues = ["command" : "volume", "level" : value/10]
        let session = WCSession.defaultSession()

        session.sendMessage(requestValues as! [String : AnyObject], 
        replyHandler: { reply in
            self.statusLabel.setText(reply["status"] as? String)
            }, errorHandler: { error in
                print("error: \(error)")
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
