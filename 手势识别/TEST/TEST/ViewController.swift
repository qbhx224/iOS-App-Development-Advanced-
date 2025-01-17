//
//  ViewController.swift
//  test
//
//  Created by student on 2024/9/5.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btn: UIButton!
    
//    lazy var label:UILabel = {
//        let label = UILabel()
//        label.text = "2024.9.5"
//        label.sizeToFit()
//        label.center = view.center
//        label.isUserInteractionEnabled = true   //允许用户互动
//        return label
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.addSubview(label)
//
//        let tap = UITapGestureRecognizer(target: self, action: #selector(tapPress))
//        tap.numberOfTapsRequired = 2 //点击次数（双击）
////        tap.numberOfTouchesRequired = 2 //多指点击
//        label.addGestureRecognizer(tap)
        
        
//        let tapPressGesture = UITapGestureRecognizer(target: self, action: #selector(tapPress(_:)))
//        btn.addGestureRecognizer(tapPressGesture)
    }

//    @objc func tapPress(_ sender: Any) {
//        label.text = "2024.9.6"
//
//        UIView.animate(withDuration: 1.5) {
//            self.label.textColor = .red
//            self.label.font = .systemFont(ofSize: 20)
//            self.label.sizeToFit()
//        }
//    }
    
    

//    @IBAction func tapPress(_ sender: Any) {
//        view.backgroundColor = .brown
//}

    
    @IBAction func btn1(_ sender: UIButton) {
        sender.backgroundColor = .blue
    }
    
    
}
