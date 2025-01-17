//
//  ViewController.swift
//  TEATA
//
//  Created by student on 2024/12/19.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .gray
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let url = URL(string: "ToBApp://") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

