//
//  CWLViewController.swift
//  test
//
//  Created by student on 2024/12/31.
//

import UIKit

class CWLViewController: SceneDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // 创建UILabel实例
        let label = UILabel()
        // 设置文本内容
        label.text = "查物流"
        // 设置文本颜色
        label.textColor = UIColor.black
        // 设置字体
        label.font = UIFont.systemFont(ofSize: 18)
        // 设置文本对齐方式
        label.textAlignment = .center
        // 设置位置和大小
        label.frame = CGRect(x: 50, y: 100, width: 200, height: 30)
        // 添加文本到view上
        view.addSubview(label)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
