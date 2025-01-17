//
//  ViewController.swift
//  多线程02
//
//  Created by student on 2024/9/12.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let queue = DispatchQueue(label: "abc")
        let queue2 = DispatchQueue.main
        // 并发
        let queue3 = DispatchQueue.global()
        let queue4 = DispatchQueue(label: "cba", attributes: .concurrent)
        
        print("开始执行")
        
//        queue3.async {
//            self.task()
//        }

        
//        queue3.asyncAfter(deadline: DispatchTime.now() + 3) {
//            self.task()
//        }
        
//        DispatchQueue.concurrentPerform(iterations: 5) { (index) in
//            print("第\(index)次")
//            self.task()
//        }
        
        
        queue4.async {
            sleep(1)
            print(Thread.current, "执行任务一")
        }
        queue4.async {
            sleep(1)
            print(Thread.current, "执行任务二")
        }
        
        
        queue4.async(flags: .barrier) {
            print("---------")
        }
        
        queue4.async {
            sleep(1)
            print(Thread.current, "执行任务三")
        }
        queue4.async {
            sleep(1)
            print(Thread.current, "执行任务四")
        }
        
        
        print("结束执行")
    }
    
    func task() {
        for i in 1 ... 10 {
            Thread.sleep(forTimeInterval: 0.5)
            print(Thread.current, i)
        }
    }
}

