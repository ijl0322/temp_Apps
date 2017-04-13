//
//  AudioPlayerSingleton.swift
//  UiDynamicTest
//
//  Created by Isabel  Lee on 11/04/2017.
//  Copyright © 2017 isabeljlee. All rights reserved.
//


import AVFoundation

//Defines a singleton, an audio player shared by all note buttons.
class SharedAudioPlayer {
    
    //MARK: Variables
    static let player = SharedAudioPlayer()
    var audioFile: AVAudioPlayer!
    
    //MARK: Initializer
    private init() {}
    
    func play(name: String) {
        let audioFileURL = URL(fileURLWithPath: Bundle.main.path(forResource: name, ofType: "mp3")!)
        
        do {
            try audioFile = AVAudioPlayer(contentsOf: audioFileURL as URL, fileTypeHint: nil)
            audioFile.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        audioFile.play()
    }
    
}
