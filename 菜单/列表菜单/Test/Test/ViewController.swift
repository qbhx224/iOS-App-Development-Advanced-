//
//  ViewController.swift
//  Test
//
//  Created by student on 2024/12/17.
//

import UIKit

class ViewController: UIViewController {
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "abc")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 66.0
        return tableView
    }()
    override func viewDidLoad() {
        super .viewDidLoad()
        view.addSubview(tableView)
    }
}
     
extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "abc", for: indexPath)
        cell.textLabel?.text = "Row \(indexPath.row)"
        return cell
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let element1 = UIAction(title: "扫一扫", image: UIImage(systemName: "viewfinder"), identifier: nil, discoverabilityTitle: nil) { _ in
            self.view.backgroundColor = .purple
        }
        let config = UIContextMenuConfiguration(identifier: nil) { () -> UIViewController? in
            let vc = UIViewController()
            vc.view.backgroundColor = .green
            return vc
        } actionProvider: { menus -> UIMenu? in
            return UIMenu(title: "", image: nil, identifier: nil, options: .destructive, children: [element1])
        }
        
        return config
    }
}
