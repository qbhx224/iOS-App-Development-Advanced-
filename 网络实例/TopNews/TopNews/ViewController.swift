//
//  ViewController.swift
//  TopNews
//
//  Created by student on 2024/10/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var selected: UISegmentedControl!
    var newsModel:NewsModel?
    @IBOutlet weak var tableView: UITableView!
    var types = ["youxi","tiyu"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 140
        selected.addTarget(self, action: #selector(typesome), for: .valueChanged)
        getData()
    }
    @objc func typesome(sender:UISegmentedControl){
        getData(type: types[sender.selectedSegmentIndex])
    }
    func getData(type:String = "top"){
        let url = URL(string: "http://v.juhe.cn/toutiao/index?type=\(type)&page=1&page_size=30&is_filter=1&key=3f014fcb91bb478b8f517b2047fadef8")!
        let seesion = URLSession.shared
        let task = seesion.dataTask(with: url) { (data, respone, error) in
            if error == nil, data != nil{
                self.newsModel = try? JSONDecoder().decode(NewsModel.self, from: data!)
                OperationQueue.main.addOperation {
                    self.tableView.reloadData()
                }
            }
        }
        task.resume()
    }
}
extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsModel == nil ? 0 : newsModel!.result.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "News", for: indexPath) as! NewsTableViewCell
        cell.titleLB?.text = newsModel?.result.data[indexPath.row].title
        cell.authorLB?.text = newsModel?.result.data[indexPath.row].author_name
        cell.dateLB?.text = newsModel?.result.data[indexPath.row].date
        return cell
    }
    
    
}
extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectModel = newsModel?.result.data[indexPath.row]
        let detailVC = DetailsViewController()
        detailVC.item = selectModel
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
