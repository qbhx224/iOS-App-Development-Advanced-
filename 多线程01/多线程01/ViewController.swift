//
//  ViewController.swift
//  多线程01
//
//  Created by student on 2024/9/10.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 100

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        print(Thread.current)
        
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let thread1 = Thread(target: self, selector: #selector(run), object: nil)
        thread1.name = "窗口1"
        let thread2 = Thread(target: self, selector: #selector(run), object: nil)
        thread2.name = "窗口2"
        let thread3 = Thread(target: self, selector: #selector(run), object: nil)
        thread3.name = "窗口3"
      
//        thread1.start()
//        thread2.start()
//        thread3.start()
        
        Thread {
            
        }
        
        Thread.detachNewThread {
            print(Thread.current)
        }
    }
    
    @objc func run() {
        while count > 0 {
            count = count - 1
            print(Thread.current.name, "卖出去一张票,还剩", count)
        }
    }
}

