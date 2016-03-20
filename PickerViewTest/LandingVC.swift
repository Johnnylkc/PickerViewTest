//
//  LandingVC.swift
//  PickerViewTest
//
//  Created by 劉坤昶 on 2016/3/18.
//  Copyright © 2016年 JohnnyKetchup. All rights reserved.
//

import UIKit

class LandingVC: UIViewController{

    
    let loginButton = UIButton()
    let navi = UINavigationController()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        allUI()
    
    
    }
    
    func allUI()
    {
        self.view.backgroundColor = UIColor.whiteColor()
        
        loginButton.frame = CGRectMake(0, 0, 300, 50)
        loginButton.center = CGPointMake(self.view.frame.size.width/2, 300)
        loginButton.setTitle("登入", forState: .Normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFontOfSize(20)
        loginButton.backgroundColor = UIColor.redColor()
        loginButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        loginButton.addTarget(self, action: "goTo:", forControlEvents: .TouchDown)
        self.view.addSubview(loginButton)
        
    }
    
    
    func goTo(sender:UIButton)
    {
        let oneController = MainTVC()
        let oneNav = UINavigationController(rootViewController: oneController)
        oneController.tabBarItem = UITabBarItem(title: "第一頁", image: UIImage(), selectedImage: UIImage())
        
        let twoController = SecondVC()
        let twoNav = UINavigationController(rootViewController: twoController)
        twoController.tabBarItem = UITabBarItem(title: "第二頁", image: UIImage(), selectedImage: UIImage())
        
        let controllers = [oneNav,twoNav]
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = controllers
        
        tabBarController.modalTransitionStyle = .CrossDissolve
        self.presentViewController(tabBarController, animated: true, completion: nil)
        
        
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
