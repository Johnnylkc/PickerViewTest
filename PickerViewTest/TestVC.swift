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
    
    let testView = UIView()
    
    
    var tableViewH = [NSLayoutConstraint]()
    var tableViewV = [NSLayoutConstraint]()
    var scrollBarH = [NSLayoutConstraint]()
    var scrollBarV = [NSLayoutConstraint]()
    
    var currentoffset:CGFloat = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        

        
        allUI()
        autoLayout()
        
    }
    
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(true)
        

        
    }

    func allUI()
    {
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height )
        tableView.backgroundColor = UIColor.grayColor()
        tableView.delegate = self
        tableView.dataSource = self
        automaticallyAdjustsScrollViewInsets = false
        //tableView.showsVerticalScrollIndicator = false
        
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
        scrollBar.frame = CGRectMake(0, 64, self.view.frame.size.width, 46)
        scrollBar.backgroundColor = UIColor.redColor()
        scrollBar.contentSize = CGSizeMake(scrollButton1.frame.size.width * 3 + 40, 0)
        scrollBar.showsHorizontalScrollIndicator = false
        self.view.addSubview(scrollBar)
        
        
        testView.frame = CGRectMake(0, 64, self.view.frame.size.width, 46)
        testView.backgroundColor = UIColor.blueColor()
        //self.view.addSubview(testView)
        //tableView.tableHeaderView = testView
        
        let tap = UITapGestureRecognizer(target: self, action: "tap:")
        tap.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tap)
        

        
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
    
    
    func tap(sender:UITapGestureRecognizer)
    {
        UIView.animateWithDuration(0.3) { () -> Void in
            
            self.scrollBarV[0].constant = 64
            self.view.layoutSubviews()
        }
    
        print("gt")
    }
    
    
    
    
    
    
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView)
    {
       
        
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView)
    {
        

        if scrollView.panGestureRecognizer.translationInView(scrollView).y < 0
        {
           
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                
                self.scrollBarV[0].constant = 18
                self.scrollBar.alpha = 0
                
                self.view.layoutSubviews()
                                
                })

        }
        else
        {

            UIView.animateWithDuration(0.3, animations: { () -> Void in
                
                self.scrollBarV[0].constant = 64
                
                self.view.layoutSubviews()
                
                
            })
                            
                scrollBar.alpha = 1

        
        }
        
        
    }


    
    
    
    
    func autoLayout()
    {
        tableView.translatesAutoresizingMaskIntoConstraints = (false)
        scrollBar.translatesAutoresizingMaskIntoConstraints = (false)
        
        let dic = ["tableView":tableView,"scrollBar":scrollBar]
        

        ////tableView
        tableViewH = NSLayoutConstraint.constraintsWithVisualFormat("H:|[tableView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dic)
        self.view.addConstraints(tableViewH)
        
        tableViewV = NSLayoutConstraint.constraintsWithVisualFormat("V:[scrollBar][tableView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dic)
        self.view.addConstraints(tableViewV)
        
  
        ////scrollBar
        scrollBarH = NSLayoutConstraint.constraintsWithVisualFormat("H:|[scrollBar]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dic)
        self.view.addConstraints(scrollBarH)
        
        scrollBarV = NSLayoutConstraint.constraintsWithVisualFormat("V:|-64-[scrollBar(46)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dic)
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
