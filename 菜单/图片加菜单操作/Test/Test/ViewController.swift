//
//  ViewController.swift
//  Test
//
//  Created by student on 2024/12/17.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgview.isUserInteractionEnabled = true
        let iteraction = UIContextMenuInteraction(delegate: self)
        imgview.addInteraction(iteraction)
        
        view.backgroundColor = .gray
        

        
        //17-24 按钮1
        let button1 = UIButton(type: .contactAdd)
        button1.center = view.center
        
        let element1 = UIAction(title: "点赞", image: UIImage(systemName: "hand.thumbsup.fill"), identifier: nil, discoverabilityTitle: nil) { _ in
            self.view.backgroundColor = .orange
        }
        
        button1.menu = UIMenu(title: "", image: nil, identifier: nil, options: .displayInline, children: [element1])
        
        view.addSubview(button1)
        
        //27-34 按钮2
        let button2 = UIButton(type: .contactAdd)
        let button2YOffset = button1.bounds.height + 300
        button2.center = CGPoint(x: button1.center.x, y: button2YOffset)
        
        let element2 = UIAction(title: "关注", image: UIImage(systemName: "person.fill"), identifier: nil, discoverabilityTitle: nil) { _ in
            self.view.backgroundColor = .blue
        }
        
        button2.menu = UIMenu(title: "", image: nil, identifier: nil, options: .displayInline, children: [element2])
        view.addSubview(button2)
    }
}
extension ViewController: UIContextMenuInteractionDelegate {
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        let element1 = UIAction(title: "扫一扫", image: UIImage(systemName: "viewfinder"), identifier: nil, discoverabilityTitle: nil) { _ in
            self.view.backgroundColor = .purple
        }
        let config = UIContextMenuConfiguration(identifier: nil) { () -> UIViewController? in
            let vc = UIViewController()
            vc.view.backgroundColor = .black
            return vc
        } actionProvider: { menus -> UIMenu? in
            return UIMenu(title: "", image: nil, identifier: nil, options: .destructive, children: [element1])
        }
        
        return config
    }
}
