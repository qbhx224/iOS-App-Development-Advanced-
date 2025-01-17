//
//  ViewController.swift
//  TEST
//
//  Created by student on 2024/11/28.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var recorder:AVAudioRecorder?
    var player:AVAudioPlayer?
    var fileURL:URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        AVCaptureDevice.requestAccess(for: .audio) { flag in
//            if flag {
//                print("授权成功")
//            }
//        }
        
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(.playAndRecord)
            try session.setActive(true)
        } catch {
            print(error.localizedDescription)
        }
        
        
        session.requestRecordPermission() { flag in
            if flag {
                print("授权成功")
            }
        }
        
        print(NSHomeDirectory())
        // 录音内容会存到沙盒
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        fileURL = url.appendingPathComponent("record.caf")
        
        // 录制设置
        let settings:[String:Any] = [
            AVFormatIDKey:NSNumber(value: kAudioFormatMPEG4AAC), // 录音格式
            AVNumberOfChannelsKey: 2, // 音频声道，双声道
            AVEncoderAudioQualityKey:AVAudioQuality.max.rawValue, // 音频质量，高质量
            AVEncoderBitRateKey: 320000, // 码率
            AVSampleRateKey: 44100.0 // 采样率
        ]
        
        do {
            try recorder = AVAudioRecorder(url: fileURL, settings: settings)
        } catch {
            print(error.localizedDescription)
        }
    }
    @IBAction func record(_ sender: Any) {
        recorder?.record()
    }
    
    @IBAction func stop(_ sender: Any) {
        recorder?.stop()
    }
    
    @IBAction func play(_ sender: Any) {
        do {
            player = try AVAudioPlayer(contentsOf: fileURL)
        } catch {
            print(error.localizedDescription)
        }
        player?.play()
    }
}

extension ViewController: AVAudioRecorderDelegate {
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        print(#function)
    }
}
