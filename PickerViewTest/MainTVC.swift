//
//  MainTVC.swift
//  PickerViewTest
//
//  Created by 劉坤昶 on 2016/3/3.
//  Copyright © 2016年 JohnnyKetchup. All rights reserved.
////

import UIKit
import Alamofire
import AlamofireImage

class MainTVC: UITableViewController ,UISearchBarDelegate ,  UISearchResultsUpdating{

    ////裝JSON
    var jsonArray = NSMutableArray()
    var testarray = NSMutableArray()
    var johnnyArray = NSMutableArray()
    var threeArray = NSMutableArray()
    
    ////搜尋用
    var nameArray = NSMutableArray()
    var filterArray = [String]()
    
    var searchController = UISearchController()
    
   // var cellChange:Bool = true
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        allUI()
        alamofireGet()

        
    }

    func allUI()
    {
        
        self.tableView.registerClass(MainCell.self, forCellReuseIdentifier: "cell")
        self.tableView.backgroundColor = UIColor(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1)
        self.tableView.separatorStyle = .None
        self.tableView.rowHeight = 200
        
        ////搜尋相關設定
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
        let textField = searchController.searchBar.valueForKey("searchField") as! UITextField
        textField.backgroundColor = UIColor.yellowColor()
        
        self.navigationItem.titleView = searchController.searchBar

    
      
    }
    
   
    func alamofireGet()
    {
        let url = "http://magipea.com/admin/product/list/json"
        Alamofire.request(.GET, url).responseJSON { response in
              
                if let JSON = response.result.value
                {
                    ////jsonArray裝整個ＪＳＯＮ
                    self.jsonArray = JSON as! NSMutableArray
                    
                    ////從josnarray 找出type_name是...的商品 裝進testArray
                    for item in self.jsonArray
                    {
                        let type = item["type_name"] as! String
                        
                        if type == "主要商品"
                        {
                            self.testarray.addObject(item)
                        }
                    
                    }
                
                    
                    for item2 in self.testarray
                    {
                        self.johnnyArray.addObject(item2["color"]!![0] )
                    }
                    
                    for item3 in self.johnnyArray
                    {
                        let oneArray:NSMutableArray = item3["picture"] as! NSMutableArray
                        
                        for item4 in oneArray
                        {
                            self.threeArray.addObject(item4)
                        }
                    
                    }
                    
                    //////搜尋用
                    for item4 in self.testarray
                    {
                        self.nameArray.addObject(item4["name"] as! String)
                    }
                    
                    
                }
            
            self.tableView.reloadData()
        }
    }

    
    

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if  searchController.active
        {
            return filterArray.count
        }
        else
        {
            return self.testarray.count
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
      
        var rowHeight : CGFloat = 0
        
        if !searchController.active
        {
            rowHeight = 200
        }
        else
        {
            rowHeight = 50
        }
        
        return rowHeight
    }

  
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        if !searchController.active
        {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MainCell
        
            cell.backgroundColor = UIColor.clearColor()
            cell.selectionStyle = .None
        
//            let dic1 = self.jsonArray[indexPath.row]
            let dic2 = self.testarray[indexPath.row]
            let dic3 = self.threeArray[indexPath.row]
        
                if dic3["image"] != nil
                {
                    cell.indicator.startAnimating()
                
                    let imageURL = "http://magipea.com/admin/uploads/" + "\(dic3["image"] as! String)"
                    Alamofire.request(.GET, imageURL).responseImage { response in
                
                        if let image = response.result.value
                        {
                            dispatch_async(dispatch_get_main_queue())
                            {
                                cell.indicator.stopAnimating()
                                cell.bigImage.image = image
                            }
                     
                        }
                    }
                }
  
                if dic2["name"] != nil
                {
                    cell.titleTextView.text = dic2["name"] as! String
                }
        
                if dic2["product_discount"] != nil
                {
                    cell.discountLabel.text = "Discount 折扣 : " + "\(dic2["product_discount"] as! String)" + "%"
                }
        
                if dic2["sale_price_ntd"] != nil
                {
                    cell.salePriceLabel.text = "NT$:" + "\(dic2["sale_price_ntd"] as! String)"
                }
        
                if dic2["price_ntd"] != nil
                {
                    let attributedText = NSAttributedString(string: "NT$" + "\(dic2["price_ntd"] as! String)", attributes: [NSStrikethroughStyleAttributeName: 1])
            
                    cell.priceLabel.attributedText = attributedText
                }
        
                return cell
            
        }
        else
        {
            
            let cell = UITableViewCell(style: .Value1, reuseIdentifier: "searchCell")
            
            if  searchController.searchBar.text != ""
            {
                cell.textLabel?.text = filterArray[indexPath.row]
                cell.backgroundColor = UIColor.whiteColor()
            }
            else
            {
                cell.textLabel?.text = "rrr"
                cell.backgroundColor = UIColor.yellowColor()
            }
            
            return cell
        }
        
        
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
       
        if searchController.active && searchController.searchBar.text != ""
        {
            let controller = DetailVC()
            self.navigationController?.pushViewController(controller, animated: true)
            //searchController.active = false
            self.view.endEditing(true)
            
            
            let name = filterArray[indexPath.row]
            controller.detailName = name as String
            
                        
        }
        else
        {
            let controller = DetailVC()
            self.navigationController?.pushViewController(controller, animated: true)

            let oldDic01:NSDictionary = threeArray[indexPath.row] as! NSDictionary
            let oldDic02:NSDictionary = testarray[indexPath.row] as! NSDictionary
            
            controller.catchDic01 = oldDic01
            controller.catchDic02 = oldDic02
            
            
        }
        
        
    }
    
    
    

    ////搜尋霸的代理方法 當搜尋霸開始編輯時
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool
    {
        print("你開始搜尋囉")

        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "searchCell")
        
        return true
    }
    
    ////搜尋霸的代理方法 當搜尋霸結束編輯時
    func searchBarShouldEndEditing(searchBar: UISearchBar) -> Bool
    {
        print("結束搜尋")

        tableView.registerClass(MainCell.self, forCellReuseIdentifier: "cell")

        return true
    }
    
    ////搜尋霸代理方法 呈現搜尋結果
    func updateSearchResultsForSearchController(searchController: UISearchController)
    {
        
        self.filterArray.removeAll(keepCapacity: false)
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        
        let array = (self.nameArray as NSArray ).filteredArrayUsingPredicate(searchPredicate)
        
        self.filterArray = array as! [String]
        
        self.tableView.reloadData()
        
    }

    
    
    
    
    
    
    
    
    
    
    
  
}////////////////////////last
