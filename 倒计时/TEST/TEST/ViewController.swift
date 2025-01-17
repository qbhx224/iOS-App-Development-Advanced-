//
//  ViewController.swift
//  TEST
//
//  Created by student on 2024/12/12.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var count: UILabel!
    var number = 5
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置UILabel可交互，以便可以添加手势识别器
        count.isUserInteractionEnabled = true
        // 创建一个UITapGestureRecognizer，当用户点击UILabel时，会调用run方法
        let tap = UITapGestureRecognizer(target: self, action: #selector(run))
        // 将手势识别器添加到UILabel上
        count.addGestureRecognizer(tap)
    }
    @objc func run() {
        // 创建一个Timer，每隔1秒触发一次，如果repeats为true，则会重复触发
        timer = Timer(timeInterval: 1.0, repeats: true, block: { _ in
            // 将UILabel设置为不可交互，防止在倒计时期间被再次点击
            self.count.isUserInteractionEnabled = false
            // 如果计数值小于等于0，则停止计时器，并将计数值重置为5
            if self.number <= 0 {
                self.timer.fireDate = .distantFuture // 停止计时器
                self.number = 5 // 重置计数值
                self.count.isUserInteractionEnabled = true // 再次允许UILabel被点击
            } else {
                // 如果计数值大于0，则减1
                self.number -= 1
            }
            // 更新UILabel的文本为当前的计数值
            self.count.text = "\(self.number)"
        })
        // 将计时器添加到当前的RunLoop中，以便它可以在指定的时间间隔触发
        RunLoop.current.add(timer, forMode: .common)
    }
}
