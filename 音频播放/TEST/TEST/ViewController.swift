//
//  ViewController.swift
//  TEST
//
//  Created by student on 2024/11/14.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player:AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func Play(_ sender: Any) {
        let url = Bundle.main.url(forResource: "圣诞快乐，劳伦斯先生", withExtension: "mp3")!
        do {
            player = try AVAudioPlayer(contentsOf: url)
        } catch {
            print(error)
        }
    }
    
    @IBAction func play(_ sender: Any) {
        player?.play()
    }
    
    @IBAction func pause(_ sender: Any) {
        player?.pause()
    }
}

