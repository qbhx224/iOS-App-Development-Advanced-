//
//  ViewController.swift
//  TEST
//
//  Created by student on 2024/11/12.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnClick(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            playSound(name: "do1")
        case 2:
            playSound(name: "re2")
        case 3:
            playSound(name: "mi3")
        case 4:
            playSound(name: "fa4")
        case 5:
            playSound(name: "sol5")
        case 6:
            playSound(name: "la6")
        case 7:
            playSound(name: "si7")
        default:
            print("")
        }
    }
    
    func playSound(name: String) {
        var soundID: SystemSoundID = 0
        
        let fileURL = Bundle.main.url(forResource: name, withExtension: "wav")!
        
        AudioServicesCreateSystemSoundID(fileURL as CFURL, &soundID)
        
        AudioServicesPlaySystemSound(soundID)
    }
}

