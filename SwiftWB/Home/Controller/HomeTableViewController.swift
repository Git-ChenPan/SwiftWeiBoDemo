//
//  HomeTableViewController.swift
//  SwiftWB
//
//  Created by WhenYouBelieve on 2019/11/5.
//  Copyright © 2019 WhenYouBelieve. All rights reserved.
//

import UIKit
import MJExtension

class HomeTableViewController: UITableViewController {
   
    var  dataSource: StatusModel?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //从json读取数据
//        let da = NSData.init(contentsOfFile: Bundle.main.path(forResource: "Source", ofType: ".json") ?? "")
//        do {
//            let dic = try JSONSerialization.jsonObject(with: (da ?? NSData()) as Data, options: [JSONSerialization.ReadingOptions.init(rawValue: 0)])
//            if dic is Dictionary<AnyHashable, Any> {
//                dataSource = StatusModel.mj_object(withKeyValues: dic)
//            }
//        } catch let error {
//            print(error)
//        }
        
        //从json读取数据
        if let path = Bundle.main.path(forResource: "Source", ofType: ".json"),
            let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: path)),
            let dic = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableLeaves) as? [String:Any]
        
        {
            dataSource = StatusModel.mj_object(withKeyValues: dic)

        } else{
            print("文件不存在或者不是标准json")
        }
                
        tableView.backgroundColor = UIColor(red: 235/255.0, green:  235/255.0, blue:  235/255.0, alpha: 1)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.register(StatusCell.self, forCellReuseIdentifier: "cell")
        tableView.showsVerticalScrollIndicator = false
    }
}

extension HomeTableViewController {
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.statuses.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = StatusCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell") as StatusCell
        let arr = dataSource?.statuses
        let so = arr?[indexPath.row]
        cell.sourceModel = so as? StatusSourceModel ?? StatusSourceModel()
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight(for: indexPath, cellContentViewWidth: UIScreen.main.bounds.size.width - 20, tableView: tableView)
    }
}
