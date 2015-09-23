//
//  InterfaceController.swift
//  RecordApp WatchKit Extension
//
//  Created by Neil Smyth on 8/20/15.
//  Copyright © 2015 eBookFrenzy. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var playButton: WKInterfaceButton!
    var saveUrl: NSURL?

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        let fileManager = NSFileManager.defaultManager()

        let container = 
	fileManager.containerURLForSecurityApplicationGroupIdentifier(
		"group.com.payloadmedia.RecordApp")

        let fileName = "audioFile.wav"

        saveUrl = container?.URLByAppendingPathComponent(fileName)    

        
    }

    @IBAction func playAudio() {
        let options = [WKMediaPlayerControllerOptionsAutoplayKey : "true"]

        presentMediaPlayerControllerWithURL(saveUrl!, options: options, 
            completion: { didPlayToEnd, endTime, error in
                        if let err = error {
                            print(err.description)
                        }
            })

    }
    
    @IBAction func recordAudio() {
        
        playButton.setEnabled(false)

        let duration = NSTimeInterval(10)

        let recordOptions = [WKAudioRecorderControllerOptionsMaximumDurationKey : duration]
        
        presentAudioRecorderControllerWithOutputURL(saveUrl!, preset: .NarrowBandSpeech,
                            options: recordOptions, completion: { saved, error in
                
                if let err = error {
                    print(err.description)
                }
                
                if saved {
                    self.playButton.setEnabled(true)
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
