//
//  AudioPlayerManager.swift
//  MusicPlayerDemo
//
//  Created by Ali Shaker on 18/09/2021.
//

import Foundation
import AVFoundation
import MediaPlayer

class AudioPlayerManager {
    static let shared = AudioPlayerManager()
    var songs = ["Ash - Keep Me", "Ash - Give a Little"]
    var index = 0
    
    private var player = AVAudioPlayer()
    
    func playMusic(index: Int) {
        self.index = index
        let bundle = Bundle.main
        guard index < songs.count, index > -1 else { return }
        let resource = songs[index]
        guard let sound = bundle.path(forResource: resource, ofType: "mp3") else { return }
        // check this sound with audioPlayer
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
            print("sound found")
        } catch {
            print("sound not found")
        }
    }
    
    func playNext() {
        player.stop()
        if index >= songs.count - 1 {
            index = 0
        } else {
            index += 1
        }
        playMusic(index: index)
        play()
    }
    
    func playPrevious() {
        player.stop()
        if index <= 0 {
            index = songs.count - 1
        } else {
            index -= 1
        }
        playMusic(index: index)
        play()
    }
    
    func pause() {
        player.pause()
    }
    
    func play() {
        player.play()
    }
    
    func sliderDidChange(time: Float) {
        player.stop()
        player.currentTime = TimeInterval(time)
        player.prepareToPlay()
        player.play()
    }
    
    func duration() -> Float {
        return Float(player.duration)
    }
    
    func currentTime() -> Float {
        return Float(player.currentTime)
    }
    
    func songTitle() -> String {
        return songs[index]
    }
    
    func isPlaying() -> Bool {
        return player.isPlaying
    }
}
