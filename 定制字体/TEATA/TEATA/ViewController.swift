//
//  ViewController.swift
//  TEATA
//
//  Created by student on 2024/12/19.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    
    lazy var normalLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 200, width: 300, height: 30))
        label.font = UIFont(name: "PINGFANG", size: 10)
        label.text = "落霞与孤鹜齐飞，秋水共长天一色。"
        return label
    }()
    
    lazy var customLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 250, width: 300, height: 30))
        label.font = UIFont(name: "LXGW WenKai GB Screen", size: 18)
        label.text = "落霞与孤鹜齐飞，秋水共长天一色。"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .gray
        
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print(family, names)
        }
        
        view.addSubview(normalLabel)
        view.addSubview(customLabel)
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let string = UIPasteboard.general.string, let url = URL(string: string) {
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true, completion: nil)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

