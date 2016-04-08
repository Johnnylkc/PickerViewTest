//
//  SearchVC.swift
//  PickerViewTest
//
//  Created by 劉坤昶 on 2016/4/5.
//  Copyright © 2016年 JohnnyKetchup. All rights reserved.
//

import UIKit

class SearchVC: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate ,  UISearchResultsUpdating {

    var searchController = UISearchController()
    let tableView = UITableView()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        allUI()

    }
    
    
    func allUI()
    {
        self.view.backgroundColor = UIColor.groupTableViewBackgroundColor()
        
        let width = self.view.frame.size.width
        let height = self.view.frame.size.height
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.frame = CGRectMake(0, 0, width, height)
        tableView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(tableView)
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.definesPresentationContext = true
        searchController.searchBar.placeholder = "搜尋"
        searchController.searchBar.delegate = self
        searchController.searchBar.tintColor = UIColor.redColor()
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.searchBarStyle = .Minimal
        searchController.searchBar.setValue("取消", forKey:"_cancelButtonText")
        searchController.searchBar.showsCancelButton = true
        searchController.becomeFirstResponder()

        let textField = searchController.searchBar.valueForKey("searchField") as! UITextField
        textField.backgroundColor = UIColor.yellowColor()
        
        self.navigationItem.titleView = searchController.searchBar
        
        
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 20
    }
  
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: .Value1, reuseIdentifier: "cell")
        
        cell.textLabel?.text = "jj"
        
        
        return cell
    }
    
    
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool
    {
        
        return true
    }
    
    func searchBarShouldEndEditing(searchBar: UISearchBar) -> Bool
    {
        
        self.dismissViewControllerAnimated(true, completion: nil)

        
        return true
    }
    
    ////搜尋霸代理方法 呈現搜尋結果
    func updateSearchResultsForSearchController(searchController: UISearchController)
    {
        
//        self.filterArray.removeAll(keepCapacity: false)
//        
//        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
//        
//        let array = (self.nameArray as NSArray ).filteredArrayUsingPredicate(searchPredicate)
//        
//        self.filterArray = array as! [String]
//        
//        self.tableView.reloadData()
        
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
}//////////last
