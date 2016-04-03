//
//  SearchResultsVC.swift
//  PickerViewTest
//
//  Created by 劉坤昶 on 2016/4/3.
//  Copyright © 2016年 JohnnyKetchup. All rights reserved.
//

import UIKit

class SearchResultsVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

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
        tableView.registerClass(SearchResultsCell.self, forCellReuseIdentifier: "cell")
        tableView.frame = CGRectMake(0, 0,width , height)
        tableView.backgroundColor = UIColor.whiteColor()
        
        self.view.addSubview(tableView)
        
    
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
        let cell  = tableView.dequeueReusableCellWithIdentifier("cell") as! SearchResultsCell
        
        
        
        return cell
    }
}////last
