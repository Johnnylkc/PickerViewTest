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
        tableView.showsVerticalScrollIndicator = false
        tableView.registerClass(MainCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView)
    
        
        scrollButton1.frame = CGRectMake(10, 5, self.view.frame.size.width/2, 35)
        scrollButton1.backgroundColor = UIColor.whiteColor()
        scrollButton1.setTitle("按鈕1", forState: .Normal)
        scrollButton1.setTitleColor(UIColor.blackColor(), forState: .Normal)
        scrollButton1.addTarget(self, action: "scrollButton1_click:", forControlEvents: .TouchUpInside)
        scrollBar.addSubview(scrollButton1)
        
        scrollButton2.frame = CGRectMake(scrollButton1.frame.size.width+20, 5, self.view.frame.size.width/2, 35)
        scrollButton2.backgroundColor = UIColor.whiteColor()
        scrollButton2.setTitle("按鈕2", forState: .Normal)
        scrollButton2.setTitleColor(UIColor.blackColor(), forState: .Normal)
        scrollButton2.addTarget(self, action: "scrollButton2_click:", forControlEvents: .TouchUpInside)
        scrollBar.addSubview(scrollButton2)
        
        scrollButton3.frame = CGRectMake(scrollButton1.frame.size.width*2 + 30, 5, self.view.frame.size.width/2, 35)
        scrollButton3.backgroundColor = UIColor.whiteColor()
        scrollButton3.setTitle("按鈕3", forState: .Normal)
        scrollButton3.setTitleColor(UIColor.blackColor(), forState: .Normal)
        scrollButton3.addTarget(self, action: "scrollButton3_click:", forControlEvents: .TouchUpInside)
        scrollBar.addSubview(scrollButton3)
    
        ////這個scrollView的設定 擺在裡面的按鈕設定之後 是因為這樣才取得到 所有按鈕的寬 才知道contentSize要給多少
        scrollBar.backgroundColor = UIColor.redColor()
        scrollBar.contentSize = CGSizeMake(scrollButton1.frame.size.width * 3 + 40, 0)
        scrollBar.showsHorizontalScrollIndicator = false
        self.view.addSubview(scrollBar)
        
        
    }
    
    ////三個scrollButton action
    func scrollButton1_click(sender:UIButton)
    {
        print("按鈕1")
    }
    
    
    func scrollButton2_click(sender:UIButton)
    {
        print("按鈕2")
    }
    
    
    func scrollButton3_click(sender:UIButton)
    {
        print("按鈕3")
    }
    
    

    
    
    
    
    func autoLayout()
    {
        tableView.translatesAutoresizingMaskIntoConstraints = (false)
        scrollBar.translatesAutoresizingMaskIntoConstraints = (false)

        
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
