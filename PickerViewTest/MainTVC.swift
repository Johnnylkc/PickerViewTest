//
//  MainTVC.swift
//  PickerViewTest
//
//  Created by 劉坤昶 on 2016/3/3.
//  Copyright © 2016年 JohnnyKetchup. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON  ////目前還沒用到

class MainTVC: UITableViewController {

    
    var jsonArray = NSMutableArray()
    var testarray = NSMutableArray()
    var johnnyArray = NSMutableArray()

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.tableView.registerClass(MainCell.self, forCellReuseIdentifier: "cell")
        self.tableView.backgroundColor = UIColor(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1)
        self.tableView.rowHeight = 200
        
        alamofireGet()

        
    }

   
    func alamofireGet()
    {
        let url = "http://magipea.com/admin/product/list/json"
        Alamofire.request(.GET, url).responseJSON { response in
              
                if let JSON = response.result.value
                {
                    self.jsonArray = JSON as! NSMutableArray
                    //print("這是整個JSON\(self.jsonArray)")
                    
                    for item in self.jsonArray
                    {
                       let oneArray:NSMutableArray = item["color"] as! NSMutableArray
                        
                        for item2 in oneArray
                        {
                            //print("這裡應該要進入color\(item2)")
                            self.testarray.addObject(item2)
                            
                            let twoArray:NSMutableArray = item2["picture"] as! NSMutableArray
                            
                            for item3 in twoArray
                            {
                                //print("這裡應該是要進入picture\(item3)")
                                self.johnnyArray.addObject(item3)
                            }
                            
                        }
                    
                    }
                
                }
            
            self.tableView.reloadData()
        }
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.jsonArray.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 200
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MainCell
        cell.backgroundColor = UIColor.clearColor()
        
//        let dic1 = self.jsonArray[indexPath.row]
//        let dic2 = self.testarray[indexPath.row]
        let dic3 = self.johnnyArray[indexPath.row]

        
        if dic3["image"] != nil
        {
            let imageURL = "http://magipea.com/admin/uploads/" + "\(dic3["image"] as! String)"
            print(imageURL)
            Alamofire.request(.GET, imageURL).responseImage { response in
                
                    if let image = response.result.value
                    {
                        cell.bigImage.image = image
                    }
            }
        }
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
