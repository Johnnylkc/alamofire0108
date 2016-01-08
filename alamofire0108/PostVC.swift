//
//  PostVC.swift
//  alamofire0108
//
//  Created by 劉坤昶 on 2016/1/8.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

import UIKit
import Alamofire

class PostVC: UIViewController {

    var nameTF = UITextField()
    var ageTF = UITextField()
    var cityTF = UITextField()
    var postButton = UIButton()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        nameTF.frame = CGRectMake(0, 0, 200, 30)
        nameTF.center = CGPointMake(self.view.frame.size.width/2, 100)
        nameTF.borderStyle = .Bezel
        view.addSubview(nameTF)
        
        ageTF.frame = CGRectMake(0, 0, 200, 30)
        ageTF.center = CGPointMake(self.view.frame.width/2, 150)
        ageTF.borderStyle = .Bezel
        view.addSubview(ageTF)
        
        cityTF.frame = CGRectMake(0, 0, 200, 30)
        cityTF.center = CGPointMake(self.view.frame.width/2, 200)
        cityTF.borderStyle = .Bezel
        view.addSubview(cityTF)
    
        postButton.frame = CGRectMake(0, 0, 300, 40)
        postButton.center = CGPointMake(self.view.frame.width/2, 300)
        postButton.setTitle("上傳", forState: .Normal)
        postButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        postButton.backgroundColor = UIColor.yellowColor()
        postButton.addTarget(self, action: "uploadData:", forControlEvents: .TouchUpInside)
        view.addSubview(postButton)
        
        
    
    }

    
    
    
    
    func uploadData(sender:UIButton)
    {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd-hh:mm:ss"
        let timing = NSDate()
        let timeStr = dateFormatter.stringFromDate(timing)

        
        
        let userInfo = ["name":self.nameTF.text!,"age":self.ageTF.text!,"city":self.cityTF.text!,"time":timeStr]
        
        let url = "https://sheetsu.com/apis/1261d3fb"
        Alamofire.request(.POST, url, parameters: userInfo)
        
        print("\(userInfo)")
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
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
