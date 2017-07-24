//
//  ViewMenu.swift
//  BeatTheJedi
//
//  Created by Vinod Aroumougame on 20/07/2017.
//  Copyright © 2017 Vinod Aroumougame. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

class ViewMenu: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playBackgroundMusic(filename: "MaintTheme", command: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func setVolume(_ sender: UIButton) {
        if (sender.tag == 0) {
            sender.setImage(UIImage(named: "mute.png"), for: .normal)
            sender.tag = 1
            playBackgroundMusic(filename: "MaintTheme", command: 0)
        }
        else {
            sender.setImage(UIImage(named: "volume.png"), for: .normal)
            sender.tag = 0
            playBackgroundMusic(filename: "MaintTheme", command: 1)
        }
    }
    @IBAction func notavailable(_ sender: UIButton) {
        
    }
}

var backgroundMusicPlayer: AVAudioPlayer!

func playBackgroundMusic(filename: String, command: Int) {
    if (command == 1) {
        let url = Bundle.main.url(forResource: filename, withExtension: "mp3")
        guard let newUrl = url else {
            print("Could not find file called")
            return
        }
        do {
            backgroundMusicPlayer = try AVAudioPlayer(contentsOf: newUrl)
            backgroundMusicPlayer.numberOfLoops = -1
            backgroundMusicPlayer.prepareToPlay()
            backgroundMusicPlayer.play()
        }
        catch let error as NSError {
            print(error.description)
        }
    }
    else {
        backgroundMusicPlayer.stop()
    }
}
