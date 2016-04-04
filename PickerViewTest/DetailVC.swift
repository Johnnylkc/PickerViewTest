//
//  DetailVC.swift
//  PickerViewTest
//
//  Created by 劉坤昶 on 2016/4/3.
//  Copyright © 2016年 JohnnyKetchup. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class DetailVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let tableView = UITableView()
    let topImage = UIImageView()
    let nameLabel = UILabel()
    
    ////用來接資料的
    var catchDic01 = NSDictionary()
    var catchDic02 = NSDictionary()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        allUI()
        getImage()

    }

    
    func allUI()
    {
        self.view.backgroundColor = UIColor.groupTableViewBackgroundColor()
        let width = self.view.frame.size.width
        let height = self.view.frame.size.height
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRectMake(0, 0, width, height)
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(tableView)
        
        topImage.frame = CGRectMake(0, 0, width, 200)
        topImage.backgroundColor = UIColor.yellowColor()
        topImage.contentMode = .ScaleAspectFit
        
        nameLabel.frame = CGRectMake(10, topImage.frame.size.height-30, 300, 30)
        nameLabel.backgroundColor = UIColor.lightGrayColor()
        nameLabel.text = catchDic02["name"] as? String
        nameLabel.sizeToFit()
        topImage.addSubview(nameLabel)
        
        
        
    }
    
    
    func getImage()
    {
        let imageURL = "http://magipea.com/admin/uploads/" + "\(catchDic01["image"] as! String)"
        Alamofire.request(.GET, imageURL).responseImage { response in
            
            if let image = response.result.value
            {
                dispatch_async(dispatch_get_main_queue())
                {
                    self.topImage.image = image
                }
                
            }
        }

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
        var rowHeight:CGFloat = 0
        
        if indexPath.row == 0
        {
            rowHeight = 200
        }
        else
        {
            rowHeight = 50
        }
        
        return rowHeight
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: .Value1, reuseIdentifier: "cell")
        cell.selectionStyle = .None
        
        switch indexPath.row
        {
        case 0:
            cell.addSubview(topImage)
            
        default:
            break
        }
        
        
        
        return cell
    }
    
    
    
}////last
