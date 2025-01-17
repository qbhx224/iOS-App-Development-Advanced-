//
//  ViewController.swift
//  多线程01
//
//  Created by student on 2024/9/10.
//

import UIKit



class ViewController: UIViewController {
    var count = 1
    
   var lock = os_unfair_lock()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print(Thread.current)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let thread1 = Thread(target: self, selector: #selector(run), object: nil)
        thread1.name = "1"
        let thread2 = Thread(target: self, selector: #selector(run), object: nil)
        thread2.name = "2"
        let thread3 = Thread(target: self, selector: #selector(run), object: nil)
        thread3.name = "3"
        
        thread1.start()
        thread2.start()
        thread3.start()
    }
    
    @objc func run() {
        while true {
           
            os_unfair_lock_lock(&lock)
            
            if count <= 90 {
                //
                if count / 5 % 3 + 1 == Int(Thread.current.name!)! {
                    for _ in 0 ..< 5 {
                        print(Thread.current.name!, "打印", count)
                        count = count + 1
                        
                        print(Thread.current)
                     }
               }
            }
            
            os_unfair_lock_unlock(&lock)
        }
    }
}

