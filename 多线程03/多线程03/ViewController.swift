//
//  ViewController.swift
//  多线程03
//
//  Created by student on 2024/9/19.
//

import UIKit

class ViewController: UIViewController {
    let queue = DispatchQueue.global()
    
    let dispatchWorkItem = DispatchWorkItem {
        for i in 0 ..< 10 {
            sleep(1)
            print(Thread.current, i)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
       queue.async(execute: dispatchWorkItem)
        
//        dispatchWorkItem.notify(queue: .main) {
//            print("任务完成")
//        }
        
       let result =  dispatchWorkItem.wait(timeout: .now() + 3)
        
        if result == .success {
            print("执行完成")
        }
        else {
            print("未执行完成")
        }
        print("执行后续任务")
    }
}

