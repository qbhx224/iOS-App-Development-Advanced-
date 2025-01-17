//
//  ViewController.swift
//  多线程04
//
//  Created by student on 2024/9/24.
//

import UIKit

class ViewController: UIViewController {
    let opq = OperationQueue()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        opq.maxConcurrentOperationCount = 1

        let op1 = BlockOperation {
            for i in 0 ... 10 {
                //Thread.sleep(forTimeInterval: 0.3)
                print(Thread.current, i)
            }
        }
        
    
        
        let op2 = BlockOperation {
            for i in 11 ... 20 {
                //Thread.sleep(forTimeInterval: 0.3)
                print(Thread.current, i)
            }
        }
        

        let op3 = BlockOperation {
            for i in 21 ... 30 {
                //Thread.sleep(forTimeInterval: 0.3)
                print(Thread.current, i)
            }
        }
        
       
        
        let op4 = BlockOperation {
            for i in 31 ... 40 {
                //Thread.sleep(forTimeInterval: 0.3)
                print(Thread.current, i)
            }
        }
        
     
        op2.addDependency(op1)
        op3.addDependency(op2)
        op4.addDependency(op3)
        
        opq.addOperation(op1)
        opq.addOperation(op2)
        opq.addOperation(op3)
        opq.addOperation(op4)
    }
}

