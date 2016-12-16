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
        loadArticle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        tableView.register(UINib(nibName: "ArticleTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: listTableViewReusableCell)
        
    }
    
    private func configureView(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(openAddInterface))
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.tintColor = UIColor.green
        tableView.refreshControl?.attributedTitle = NSAttributedString(string: "Loading...", attributes: [NSForegroundColorAttributeName : UIColor.red])
        tableView.refreshControl?.addTarget(self, action: #selector(refreshData), for: UIControlEvents.valueChanged)
    }
    
    func refreshData(){
        
        // Get current Page
        if let currentPage = PAGINATION?.page{
            // If current page less than total pages
            //if currentPage < (PAGINATION?.totalPages)!{
                // Increase current by 1
                let newPage = currentPage + 1
                // Set current page to PAGINATION
                PAGINATION?.page = newPage
                // Start Refresh
                self.tableView.refreshControl?.beginRefreshing()
                print("Page : \(PAGINATION?.page)   TOTAL PAGE: \(PAGINATION?.totalPages)")
                self.loadArticle()
            //}else{
                self.tableView.refreshControl?.endRefreshing()
            //}
        }
    }
    
    func openAddInterface(){
        eventHandler?.addNewArticle()
    }
    
    func loadArticle(){
        eventHandler!.loadArticle(title: "", page: 1, limit: (PAGINATION?.limit!)! * (PAGINATION?.page)!)
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
            // Get the delete id
            let deleteId = data?.data?[indexPath.row].id
            // delete local article
            //self.data?.data?.remove(at: indexPath.row)
            eventHandler?.deleteArticleById(deleteId!)
        }
    }
    
}

extension ListTableViewController : ListViewProtocol{
    
    func updateViewWithoutData() {
        self.tableView.refreshControl?.endRefreshing()
    }
    
    func updateViewWithData(_ data: ArticleArray) {
        
        
        self.data = data
        self.data?.data?.reverse()
        PAGINATION?.totalPages = self.data?.pagination?.totalPages
        
        
        // Stop RefreshControl
        self.tableView.refreshControl?.endRefreshing()
        self.reloadEntities()
    }
    
    func operationSuccess() {
        loadArticle()
    }
    
    func operationFail() {
        self.reloadEntities()
    }
    
    func reloadEntities() {
        self.tableView.reloadData()
    }
}
