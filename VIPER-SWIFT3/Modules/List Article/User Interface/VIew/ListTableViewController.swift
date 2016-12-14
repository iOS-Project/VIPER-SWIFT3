//
//  ListTableViewController.swift
//  VIPER-SWIFT3
//
//  Created by Lun Sovathana on 12/12/16.
//  Copyright © 2016 Lun Sovathana. All rights reserved.
//

import UIKit
let listTableViewReusableCell = "ArticleCell"
class ListTableViewController: UITableViewController {
    
    // Data Store
    var data            : ArticleArray?
    // Presenter
    var eventHandler    : ListModuleProtocol?
    // View for No Content
    var noContentView   : UIView?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        eventHandler!.updateView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "ArticleTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: listTableViewReusableCell)
        
    }
    
    // MARK : TableView Section
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let rowCount = data?.data?.count{
            return rowCount
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 352
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: listTableViewReusableCell, for: indexPath) as! ArticleTableViewCell
        
        cell.configureCell((data?.data?[indexPath.row])!)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            eventHandler?.deleteArticleById((data?.data?[indexPath.row].id!)!)
        }
    }
    
}

extension ListTableViewController : ListViewProtocol{
    
    func updateViewWithoutData() {
        
    }
    
    func updateViewWithData(_ data: ArticleArray) {
        self.data = data
        self.reloadEntities()
    }
    
    func operationSuccess() {
        eventHandler?.loadAllArticle()
    }
    
    func operationFail() {
        self.reloadEntities()
    }
    
    func reloadEntities() {
        self.tableView.reloadData()
    }
}
