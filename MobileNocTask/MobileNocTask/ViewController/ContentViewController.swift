//
//  ContentController.swift
//  MobileNocTask
//
//  Created by Bola Ibrahim on 12/8/18.
//  Copyright © 2018 BolaIbrahim. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class ContentViewController: UIViewController {
    
    private var contentArr = [Content]()
    private var filterArr = [Content]()
    private var currentPage = 0
    private var size = 2
    private var first = false
    private var last = false
    private var isFilteres = false

    @IBOutlet weak var serverSearchBar: UISearchBar!
    @IBOutlet weak var contentTableVIew: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        serverSearchBar.delegate = self
        contentTableVIew.delegate = self
        contentTableVIew.dataSource = self
        contentTableVIew.estimatedRowHeight = 100
        
        ApiClient.getData(page: 0, size: 10) { (DataModel) in
            print(DataModel)
            self.contentArr = DataModel.content!
            self.first = DataModel.first!
            self.last = DataModel.last!
            self.contentTableVIew.reloadData()
            
        }
        
        
    }
    
    func fetchNewData() {
        ApiClient.getData(page: currentPage, size: size) { (result) in
            self.contentArr += result.content!
            self.first = result.first!
            self.last = result.last!
            self.contentTableVIew.reloadData()
        }
    }
    
}

// MARK: - Implementing Tableview protocols

extension ContentViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFilteres == false ? contentArr.count : filterArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath) as! DataTableViewCell
        
        let previewData = isFilteres == false ? contentArr[indexPath.row] : filterArr[indexPath.row]
        
        cell.configure(with: previewData)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = contentArr.count - 1
        if (indexPath.row == lastItem && self.first == true && self.last == false) || (indexPath.row == lastItem && self.first == false && self.last == false){
            self.currentPage += 1
            fetchNewData()
        }
    }
}

// MARK: - Implementing searchBar protocols

extension ContentViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == "" {
            filterArr = contentArr
            contentTableVIew.reloadData()
        } else {
            isFilteres = true
            filterArr = []
            for item in contentArr {
                let tmp: NSString = item.name! as NSString
                let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
                if range.location != NSNotFound {
                    filterArr.append(item)
                }
            }
            contentTableVIew.reloadData()
        }
    }
}
