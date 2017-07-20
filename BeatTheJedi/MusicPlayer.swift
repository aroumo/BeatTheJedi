//
//  MusicPlayer.swift
//  BeatTheJedi
//
//  Created by Vinod Aroumougame on 20/07/2017.
//  Copyright © 2017 Vinod Aroumougame. All rights reserved.
//

import Foundation
import AVFoundation

clas
var backgroundMusicPlayer: AVAudioPlayer!

func playBackgroundMusic(filename: String) {
    
    //The location of the file and its type
    let url = NSBundle.mainBundle().URLForResource(filename, withExtension: "mp3")
    
    //Returns an error if it can't find the file name
    if (url == nil) {
        println("Could not find the file \(filename)")
    }
    
    var error: NSError? = nil
    
    //Assigns the actual music to the music player
    backgroundMusicPlayer = AVAudioPlayer(contentsOfURL: url, error: &error)
    
    //Error if it failed to create the music player
    if backgroundMusicPlayer == nil {
        println("Could not create audio player: \(error!)")
        return
    }
    
    //A negative means it loops forever
    backgroundMusicPlayer.numberOfLoops = -1
    backgroundMusicPlayer.prepareToPlay()
    backgroundMusicPlayer.play()
}
