//
//  ViewController.swift
//  TEST
//
//  Created by student on 2024/12/12.
//

import UIKit

class ViewController: UIViewController {
    // 定义一个 Timer 类型的变量，用于存储定时器对象
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 在视图控制器加载后执行的额外设置
        // 设置背景颜色为灰色
        view.backgroundColor = .gray
        
        // 创建一个定时器，每隔1秒触发一次，并且设置为重复触发
//        timer = Timer(timeInterval: 1.0, repeats: true) { _ in
//            // 每次定时器触发时打印 "HELLO"
//            print("HELLO")
//        }
        
        timer = Timer(timeInterval: 1.0, target: self, selector: #selector(run), userInfo: nil, repeats: true)
        
        // 将定时器添加到当前的 RunLoop 中，指定为 .common 模式
        RunLoop.current.add(timer, forMode: .common)
    }
    
    // 定义一个 Objective-C 兼容的方法，用于在触摸屏幕时触发
    @objc func run() {
        // 打印 "WORLD"
        print("WORLD")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 当触摸屏幕时，将定时器的触发时间设置为 .distantFuture，即暂停定时器
        timer.fireDate = .distantFuture
    }

}

