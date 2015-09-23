//
//  ViewController.swift
//  WatchConnectApp
//
//  Created by Neil Smyth on 8/19/15.
//  Copyright © 2015 eBookFrenzy. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController {

    var audioSession: AVAudioSession = AVAudioSession.sharedInstance()
    var audioPlayer: AVAudioPlayer?
    @IBOutlet weak var volumeControl: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
 
        var url: NSURL?
        
        do {
            try audioSession.setCategory(AVAudioSessionCategoryPlayback)
            url = NSURL.fileURLWithPath(
                NSBundle.mainBundle().pathForResource("vivaldi",
                    ofType: "mp3")!)
        } catch {
            print("AudioSession error")
        }

        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: url!, 
				fileTypeHint: nil)
            audioPlayer?.prepareToPlay()
            audioPlayer?.volume = 0.1
        } catch let error as NSError {
            print("Error: \(error.description)")
        }

    }

    @IBAction func playAudio(sender: AnyObject) {
        startPlay()
    }
    
    @IBAction func stopAudio(sender: AnyObject) {
        stopPlay()
    }
    
    @IBAction func sliderMoved(sender: AnyObject) {
        adjustVolume(volumeControl.value)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func stopPlay() {
        audioPlayer?.stop()
    }

    func startPlay() {
        audioPlayer?.play()
    }

    func adjustVolume(level: Float)
    {
        audioPlayer?.volume = level
    }


}

