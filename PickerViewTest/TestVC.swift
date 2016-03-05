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
    
    let scrollBar = UIScrollView()
    let scrollButton1 = UIButton()
    let scrollButton2 = UIButton()
    let scrollButton3 = UIButton()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        allUI()
        autoLayout()
        
    }

    func allUI()
    {
        
        self.view.backgroundColor = UIColor.greenColor()
        
        tableView.backgroundColor = UIColor.greenColor()
        tableView.delegate = self
        tableView.dataSource = self
        automaticallyAdjustsScrollViewInsets = false
        tableView.registerClass(MainCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView)
        
    
        scrollBar.backgroundColor = UIColor.redColor()
        scrollBar.contentSize = CGSizeMake(self.view.frame.size.width + 50, 0)
        self.view.addSubview(scrollBar)
        
        scrollButton1.frame = CGRectMake(10, 5, self.view.frame.size.width/4, 30)
        scrollButton1.backgroundColor = UIColor.whiteColor()
        scrollButton1.setTitle("按鈕1", forState: .Normal)
        scrollButton1.setTitleColor(UIColor.blackColor(), forState: .Normal)
        scrollBar.addSubview(scrollButton1)
        
        scrollButton2.frame = CGRectMake(120, 5, self.view.frame.size.width/4, 30)
        scrollButton2.backgroundColor = UIColor.whiteColor()
        scrollButton2.setTitle("按鈕2", forState: .Normal)
        scrollButton2.setTitleColor(UIColor.blackColor(), forState: .Normal)
        scrollBar.addSubview(scrollButton2)
        
        scrollButton3.frame = CGRectMake(230, 5, self.view.frame.size.width/4, 30)
        scrollButton3.backgroundColor = UIColor.whiteColor()
        scrollButton3.setTitle("按鈕3", forState: .Normal)
        scrollButton3.setTitleColor(UIColor.blackColor(), forState: .Normal)
        scrollBar.addSubview(scrollButton3)
    
    
        
    }
    
    func autoLayout()
    {
        tableView.translatesAutoresizingMaskIntoConstraints = (false)
        scrollBar.translatesAutoresizingMaskIntoConstraints = (false)
        
//        scrollButton1.translatesAutoresizingMaskIntoConstraints = (false)
//        scrollButton2.translatesAutoresizingMaskIntoConstraints = (false)
//        scrollButton3.translatesAutoresizingMaskIntoConstraints = (false)
        
        let dic = ["tableView":tableView,"scrollBar":scrollBar]
        
        ////tableView
        let tableViewH = NSLayoutConstraint.constraintsWithVisualFormat("H:|[tableView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dic)
        self.view.addConstraints(tableViewH)
        
        let tableViewV = NSLayoutConstraint.constraintsWithVisualFormat("V:|-110-[tableView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dic)
        self.view.addConstraints(tableViewV)
        
        
        ////scrollBar
        let scrollBarH = NSLayoutConstraint.constraintsWithVisualFormat("H:|[scrollBar]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dic)
        self.view.addConstraints(scrollBarH)
        
        let scrollBarV = NSLayoutConstraint.constraintsWithVisualFormat("V:|-64-[scrollBar][tableView]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dic)
        self.view.addConstraints(scrollBarV)
        
//        ////scrollButton水平之間的距離和寬度
//        let scrollButtonsH = NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[scrollButton1]-10-[scrollButton2]-10-[scrollButton3]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dic)
//        scrollBar.addConstraints(scrollButtonsH)
//        
//        ////scrollButton1的垂直位置和高度
//        let scrollButton1V = NSLayoutConstraint.constraintsWithVisualFormat("V:|[scrollButton1]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dic)
//        scrollBar.addConstraints(scrollButton1V)
//        
//        ////scrollButton2的垂直位置和高度
//        let scrollButton2V = NSLayoutConstraint.constraintsWithVisualFormat("V:|[scrollButton2]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dic)
//        scrollBar.addConstraints(scrollButton2V)
//        
//        ////scrollButton3的垂直位置和高度
//        let scrollButton3V = NSLayoutConstraint.constraintsWithVisualFormat("V:|[scrollButton3]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dic)
//        scrollBar.addConstraints(scrollButton3V)
        
        
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
        cell.selectionStyle = .None
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
    *////

}
