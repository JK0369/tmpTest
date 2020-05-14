//
//  TableViewController.swift
//  tmpTest
//
//  Created by 김종권 on 2020/05/14.
//  Copyright © 2020 imustang. All rights reserved.
//

struct VO {
    var title: String = ""
    var subTitle: String = ""
}


import UIKit
class TableViewController: UITableViewController {
    var oldDataList = ["1", "2"]
     var newDataList = [VO(title: "1", subTitle: "sub1"), VO(title: "2", subTitle: "sub2")]
     var beforeSearch = true
     
    @IBAction func change(_ sender: Any) {
        if beforeSearch == true {
            beforeSearch = false
        } else {
            beforeSearch = true
        }
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
         super.viewDidLoad()
         // Do any additional setup after loading the view.
     }
     
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         if beforeSearch {
             return oldDataList.count
         } else {
             return newDataList.count
         }
     }
     
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         if beforeSearch {
             let cell = UITableViewCell(style: .default, reuseIdentifier: "cell1")
             cell.textLabel?.text = oldDataList[indexPath.row]
             return cell
         } else {
             let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell2")
             cell.textLabel?.text = newDataList[indexPath.row].title
             cell.detailTextLabel?.text = newDataList[indexPath.row].subTitle
             return cell
         }
     }
     
     override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 30
     }
}
