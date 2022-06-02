//
//  SwiftUIView.swift
//  
//
//  Created by Marvin Hülsmann on 07.04.22.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer!

/// Play sounds
/// - Parameter sound: Sound filename
func playSound(sound: String) {
    let url = Bundle.main.url(forResource: sound, withExtension: "mp3")
    
    guard url != nil else {
        return
    }
    
    do {
        audioPlayer = try AVAudioPlayer(contentsOf: url!)
        if !audioPlayer.isPlaying {
            audioPlayer?.play()
        } else {
            audioPlayer?.stop()
        }
    } catch {
        print(error)
    }
}
