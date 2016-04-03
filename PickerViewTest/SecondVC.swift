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
    let toolView = UIView()
    let oneButton = UIButton()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        allUI()
        autoLayout()
    
    }

    
    func allUI()
    {
        self.view.backgroundColor = UIColor(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1)
        
        navigationController?.navigationBar.barTintColor = UIColor.redColor()
        
        tableView.registerClass(MainCell.self, forCellReuseIdentifier: "cell")
        automaticallyAdjustsScrollViewInsets = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .None
        tableView.backgroundColor = UIColor.clearColor()
        self.view.addSubview(tableView)
        
       toolView.backgroundColor = UIColor.greenColor()
       self.view.addSubview(toolView)
        
        
        
        
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView)
    {
//        if scrollView.panGestureRecognizer.translationInView(scrollView).y < 0
//        {
//
//        }
//        else
//        {
//            
//            
//        }
        
        let scrollPos = scrollView.contentOffset
        
        if scrollPos.y > 0 && scrollPos.y <= 20
        {
            
            self.navigationController?.navigationBar.frame.size.height = -scrollPos.y
        }
        else
        {

        }
        
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
        cell.selectionStyle = .None
        cell.backgroundColor = UIColor.clearColor()
        
        
        return cell
    }
    
    func autoLayout()
    {
        tableView.translatesAutoresizingMaskIntoConstraints = (false)
        toolView.translatesAutoresizingMaskIntoConstraints = (false)
        
        let dic = ["tableView":tableView,"toolView":toolView]
        
        
        ////tableView
        let tableView_H = NSLayoutConstraint.constraintsWithVisualFormat("H:|[tableView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dic)
        self.view.addConstraints(tableView_H)
        
        let tableView_V = NSLayoutConstraint.constraintsWithVisualFormat("V:[toolView][tableView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views:dic)
        self.view.addConstraints(tableView_V)
        
        ////toolView
        let toolView_H = NSLayoutConstraint.constraintsWithVisualFormat("H:|[toolView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dic)
        self.view.addConstraints(toolView_H)
        
        let toolView_V = NSLayoutConstraint.constraintsWithVisualFormat("V:|-64-[toolView(40)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dic)
        self.view.addConstraints(toolView_V)
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
