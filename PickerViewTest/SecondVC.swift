//
//  SecondVC.swift
//  PickerViewTest
//
//  Created by 劉坤昶 on 2016/3/18.
//  Copyright © 2016年 JohnnyKetchup. All rights reserved.
//

import UIKit

class SecondVC: UIViewController , UITableViewDelegate , UITableViewDataSource {

    let tableView = UITableView()
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        allUI()
        autoLayout()
    
    }

    
    func allUI()
    {
        self.view.backgroundColor = UIColor.whiteColor()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(MainCell.self, forCellReuseIdentifier: "cell")
        
        
        self.view.addSubview(tableView)
        
        
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 30
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 200
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! MainCell
        
    
        
        
        return cell
    }
    
    func autoLayout()
    {
        
    }
    
//    override func didReceiveMemoryWarning()
//    {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
