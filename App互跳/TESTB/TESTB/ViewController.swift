//
//  ViewController.swift
//  TESTB
//
//  Created by student on 2024/12/19.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .blue
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let url = URL(string: "ToAApp://") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

