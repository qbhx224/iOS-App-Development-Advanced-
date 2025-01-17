//
//  ViewController.swift
//  音乐播放器2
//
//  Created by student on 2024/11/19.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var currentTime: UILabel!
    @IBOutlet weak var totalTime: UILabel!
    @IBOutlet weak var progressSlider: UISlider!
    
    var musics = [
        "http://172.20.53.240:8080/AppTestAPI/music1.mp3",
        "http://172.20.53.240:8080/AppTestAPI/music2.mp3",
        "http://172.20.53.240:8080/AppTestAPI/music3.mp3",
        "http://172.20.53.240:8080/AppTestAPI/music4.mp3"]
    var player: AVPlayer?
    var status = false
    var index = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session = AVAudioSession.sharedInstance()
        
        do {
            try session.setCategory(.playback)
            try session.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print(error.localizedDescription)
        }
        
        
        // 防止文字跳动
        currentTime.font = UIFont.monospacedDigitSystemFont(ofSize: 15, weight: .medium)
        totalTime.font = UIFont.monospacedDigitSystemFont(ofSize: 15, weight: .medium)
        
        player = AVPlayer(playerItem: createItem(index: index))
        
        
        // 时刻获取播放器的播放进度
        player?.addPeriodicTimeObserver(forInterval: CMTimeMakeWithSeconds(1.0, preferredTimescale: Int32(1.0)), queue: .main, using: { _ in
            self.setCurrentTime()
            let currentTime = self.player?.currentTime()
            let totalTime = self.player?.currentItem?.asset.duration
            let value = CMTimeGetSeconds(currentTime!)  / CMTimeGetSeconds(totalTime!)
            self.progressSlider.setValue(Float(value), animated: false)
        })
        
        setTotalTime()
    }
    
    func createItem(index: Int) -> AVPlayerItem {
        let url = URL(string: musics[index])!
        let item = AVPlayerItem(url: url)
        return item
    }
    
    @IBAction func progressSliderChanged(_ sender: UISlider) {
        let value = sender.value
        let current = Int(value * Float(CMTimeGetSeconds((player?.currentItem?.asset.duration)!)))
        let time = String(format: "%02d:%02d", current / 60, current % 60)
        currentTime.text = time
        player?.seek(to: CMTimeMakeWithSeconds(Float64(current), preferredTimescale: Int32(1.0)))
    }
    
    @IBAction func previous(_ sender: Any) {
        index = (index - 1 + musics.count) % musics.count
        player?.replaceCurrentItem(with: createItem(index: index))
        setTotalTime()
    }
    
    @IBAction func play(_ sender: UIButton) {
        status.toggle()
        if status {
            sender.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
            player?.play()
        } else {
            sender.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
            player?.pause()
        }
    }
    
    @IBAction func next(_ sender: Any) {
        index = (index + 1) % musics.count
        player?.replaceCurrentItem(with: createItem(index: index))
        setTotalTime()
    }
    
    func setTotalTime() {
        if let duration = player?.currentItem?.asset.duration {
            let seconds = Int(CMTimeGetSeconds(duration))
            // 516秒 8:36
            let time = String(format: "%02d:%02d", seconds / 60, seconds % 60)
            totalTime.text = time
        }
    }
    
    // 不断的调用
    func setCurrentTime() {
        if let duration = player?.currentTime() {
            let seconds = Int(CMTimeGetSeconds(duration))
            let time = String(format: "%02d:%02d", seconds / 60, seconds % 60)
            currentTime.text = time
        }
    }
}

