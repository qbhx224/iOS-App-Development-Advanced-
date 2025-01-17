//
//  ViewController.swift
//  B
//
//  Created by student on 2024/12/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var enh: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        enh.isUserInteractionEnabled = true // 使 UIImageView 可以交互
        let interaction = UIContextMenuInteraction(delegate: self) // 创建上下文菜单交互
        enh.addInteraction(interaction) // 将交互添加到 UIImageView
        
        view.backgroundColor = .white // 设置视图背景颜色为白色
        
        // 17-38 页面内菜单
        let btn1 = UIButton(type: .contactAdd) // 创建一个按钮
        btn1.center = view.center // 将按钮中心设置为视图中心
        
        let element1 = UIAction(title: "装13", image: UIImage(systemName: "hand.thumbsdown.fill"), identifier: nil, discoverabilityTitle: nil) { _ in
            self.view.backgroundColor = .white // 点击后将背景颜色设置为白色
        }
        
        btn1.menu = UIMenu(title: "", image: nil, identifier: nil, options: .displayInline, children: [element1]) // 为按钮设置菜单
        view.addSubview(btn1) // 将按钮添加到视图中
        
        let btn2 = UIButton(type: .contactAdd) // 创建另一个按钮
        btn2.center = CGPoint(x: btn1.center.x, y: 500) // 设置按钮中心位置
        
        let element2 = UIAction(title: "让你飞起来", image: UIImage(systemName: "hand.point.up.left.fill"), identifier: nil, discoverabilityTitle: nil) { _ in
            self.view.backgroundColor = .black // 点击后将背景颜色设置为黑色
        }
        
        btn2.menu = UIMenu(title: "", image: nil, identifier: nil, options: .displayInline, children: [element2]) // 为按钮设置菜单
        view.addSubview(btn2) // 将按钮添加到视图中
        
        // 转AppDelegate和SceneDelegate,主页图标按钮
        //        func addShortcuts() {
        //            let icon1 = UIApplicationShortcutIcon(systemImageName: "hand.thumbsdown.fill")
        //            let item1 = UIApplicationShortcutItem(type: "1", localizedTitle: "装13", localizedSubtitle: nil, icon: icon1, userInfo: nil)
        //
        //            let icon2 = UIApplicationShortcutIcon(systemImageName: "hand.point.up.left.fill")
        //            let item2 = UIApplicationShortcutItem(type: "2", localizedTitle: "让你飞起来", localizedSubtitle: nil, icon: icon2, userInfo: nil)
        //
        //            UIApplication.shared.shortcutItems = [item1, item2]
        //        }
        //
        //        func windowScene(_ windowScene: UIWindowScene, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        //            let rootViewController = self.window?.rootViewController
        //            switch shortcutItem.type {
        //            case "1":
        //                rootViewController?.view.backgroundColor = .black
        //            case "2":
        //                rootViewController?.view.backgroundColor = .white
        //            default:
        //                break
        //            }
        //            completionHandler(true)
        //        }
    }
}

// 整活代码74-94
class ImageViewController: UIViewController {
    private var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(image: UIImage(named: "1.jpg"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        // 设置 imageView 的约束，使其填充整个视图
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension ViewController: UIContextMenuInteractionDelegate {
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        let element3 = UIAction(title: "黑手", image: UIImage(systemName: "hand.wave.fill"), identifier: nil, discoverabilityTitle: nil) { _ in
            self.view.backgroundColor = .black // 点击后将背景颜色设置为黑色
        }
        let config = UIContextMenuConfiguration(identifier: nil) { () ->
            UIViewController? in
            let vc = ImageViewController() // 创建 ImageViewController 实例
            //            let vc = UIViewController()
            //            vc.view.backgroundColor = .blue
            return vc
        } actionProvider: { menus -> UIMenu? in
            return UIMenu(title: "", image: nil, identifier: nil, options: .destructive, children: [element3]) // 创建菜单
        }
        return config
    }
}
