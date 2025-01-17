//
//  DetailsViewController.swift
//  TopNews
//
//  Created by student on 2024/10/24.
//

import UIKit
import WebKit
class DetailsViewController: UIViewController {
    var item :Item?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = item?.title
        if let item = item ,let url = URL(string: item.url){
            let webView = WKWebView(frame: UIScreen.main.bounds)
            webView.load(URLRequest(url: url))
        view.addSubview(webView)
        }
    }
    


}
