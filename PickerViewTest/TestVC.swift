//
//  TestVC.swift
//  PickerViewTest
//
//  Created by 劉坤昶 on 2016/3/4.
//  Copyright © 2016年 JohnnyKetchup. All rights reserved.
//

import UIKit

class TestVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let tableView = UITableView()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGrayColor()

        
        allUI()
        autoLayout()
        
    }

    func allUI()
    {
        self.tableView.frame = CGRectMake(0, 170, self.view.frame.size.width, 400)
        self.tableView.backgroundColor = UIColor.whiteColor()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.automaticallyAdjustsScrollViewInsets = false
        self.tableView.registerClass(MainCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView)
        
        
    }
    
    func autoLayout()
    {
        tableView.translatesAutoresizingMaskIntoConstraints = (false)
        
        let dic = ["tableView":tableView]
        
        ////tableView
        let tableViewH = NSLayoutConstraint.constraintsWithVisualFormat("H:|[tableView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dic)
        self.view.addConstraints(tableViewH)
        
        let tableViewV = NSLayoutConstraint.constraintsWithVisualFormat("V:|-110-[tableView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dic)
        self.view.addConstraints(tableViewV)
        
        
    }
    
    

    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 20
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 200
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MainCell
        
        //cell.textLabel?.text = "ggg"
        
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
