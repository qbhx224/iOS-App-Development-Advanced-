//
//  ViewController.swift
//  多线程05
//
//  Created by student on 2024/9/26.
//

import UIKit

class ViewController: UIViewController {
    let opq = OperationQueue()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let op1 = BlockOperation {
            print("执行任务1")
            sleep(3)
        }
        opq.addOperation(op1)
        
        let op2 = BlockOperation {
            print("执行任务2")
            sleep(2)
        }
        opq.addOperation(op2)
        
        opq.isSuspended = true
        
        let op3 = BlockOperation {
            print("执行任务3")
            sleep(1)
        }
        opq.addOperation(op3)
        
        let op4 = BlockOperation {
            print("执行任务4")
            sleep(1)
        }
        opq.addOperation(op4)
        
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        opq.isSuspended = false
    }
}

