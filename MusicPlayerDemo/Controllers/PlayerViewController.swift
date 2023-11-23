//
//  PlayerViewController.swift
//  MusicPlayerDemo
//
//  Created by Ali Shaker on 3/24/21.
//

import UIKit
import AVFoundation
import MediaPlayer

class PlayerViewController: UIViewController {
    
    @IBOutlet weak var songAlbumImagView: UIImageView!
    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var audioSlider: UISlider!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var playImageView: UIImageView!
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        AudioPlayerManager.shared.playMusic(index: index)
        didClickPlay(self)
        audioSlider.maximumValue = AudioPlayerManager.shared.duration()
        let _ = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
        
        songAlbumImagView.addRoundedCorners()
        songAlbumImagView.dropShadow(shadowOpacity: 0.5)
        
        setupMusicDetails()
    }
    
    func setupMusicDetails() {
        songTitleLabel.text = AudioPlayerManager.shared.songTitle()
        songAlbumImagView.image = UIImage(named: AudioPlayerManager.shared.songTitle())
    }
    
    @objc func updateSlider() {
        audioSlider.value = AudioPlayerManager.shared.currentTime()
    }
    
    @IBAction func didClickPlay(_ sender: Any) {
        if AudioPlayerManager.shared.isPlaying() {
            AudioPlayerManager.shared.pause()
            playImageView.image = UIImage(systemName: "play.fill")
        } else {
            AudioPlayerManager.shared.play()
            if AudioPlayerManager.shared.isPlaying() {
                playImageView.image = UIImage(systemName: "pause.fill")
            }
        }
    }
    @IBAction func didClickClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didClickPreviuos(_ sender: Any) {
        AudioPlayerManager.shared.playPrevious()
        setupMusicDetails()
    }
    
    @IBAction func volumeSliderDidChange(_ sender: Any) {
        AudioPlayerManager.shared.sliderDidChange(time: audioSlider.value)
    }
    
    @IBAction func didClickNext(_ sender: Any) {
        AudioPlayerManager.shared.playNext()
        setupMusicDetails()
    }
}

