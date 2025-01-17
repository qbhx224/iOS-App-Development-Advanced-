//
//  ViewController.swift
//  多线程06
//
//  Created by student on 2024/10/8.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var swi: UISwitch!
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        thread()
        gcd()
        opq()
    }
    
    
    func thread() {
        let thread = Thread {
            print(#function, Thread.current)
            
            self.perform(#selector(self.updateUI), on: Thread.main, with: nil, waitUntilDone: false)
        }
        thread.start()
    }
    
    @objc func updateUI() {
        self.label.text = "20241008"
        print(#function, Thread.current)
    }
    
    func gcd() {
        DispatchQueue.global().async {
            print(#function, Thread.current)
            
            OperationQueue.main.addOperation {
                self.progressView.setProgress(1.0, animated: true)
                print(#function, Thread.current)
            }
        }
    }
    
    func opq() {
        OperationQueue().addOperation {
            print(#function, Thread.current)
            
            
            
            DispatchQueue.main.async {
                self.swi.isOn = false
                print(#function, Thread.current)
            }
        }
    }
}

