//
//  ViewController.swift
//  触摸
//
//  Created by student on 2024/9/3.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //print(touches.count)
        
        let touch = touches.first!
        // print(touch.window, touch.view, touch.force)
        let point = touch.location(in: view)
        print(point.x, point.y)
        
        if point.y < UIScreen.main.bounds.height * 0.5 {
            if point.x < UIScreen.main.bounds.width * 0.5 {
                view.backgroundColor = .green
            }
            else {
                view.backgroundColor = .blue
            }
        }
        else {
            if point.x < UIScreen.main.bounds.width * 0.5 {
                view.backgroundColor = .orange
            }
            else {
                view.backgroundColor = .purple
            }
        }
        
        // print(#function)
        
        if touch.tapCount == 2 {
            view.backgroundColor = .white
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // print(#function)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // print(#function)
    }
}

