//
//  MainTVC.swift
//  alamofire0108
//
//  Created by 劉坤昶 on 2016/1/8.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

import UIKit
import Alamofire

class MainTVC: UITableViewController {

    
    var jsonArray = NSMutableArray()
    var nameArray = [String]()
    var cityArray = [String]()
   
    ////畫面載入前
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(true)
        
        self.tableView.rowHeight = 100
        
        alamofireGET()

        
    }

    ////畫面載入後
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.tableView.registerClass(MainCell.self, forCellReuseIdentifier: "cell")
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "jsutUpload:")
        
        
        
    }
    
    
    
    func alamofireGET()
    {
        let url = "https://sheetsu.com/apis/1261d3fb"
        
        Alamofire.request(.GET, url).responseJSON { response in
               
                if let JSON = response.result.value
                {
                    self.jsonArray = JSON["result"] as! NSMutableArray
                    print("\(self.jsonArray)")
                    
                   
                    for item in self.jsonArray
                    {
                        
                        let preNameArray = item["name"] as? String
                        self.nameArray.append(preNameArray!)
                        
                        let preCityArray = item["city"] as? String
                        self.cityArray.append(preCityArray!)
                       
                        print(self.nameArray)
                        print(self.cityArray)
                    }
                    
                    self.tableView.reloadData()
                }////
            
        }
        
    }
    
    
    
    func jsutUpload(sender:UIButton)
    {
        let controller = PostVC()
        
        self.presentViewController(controller, animated: true, completion: nil)
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.nameArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MainCell

        let dicForCell = self.jsonArray[indexPath.row] as! NSDictionary
        
        cell.nameLabel.text = dicForCell["name"] as? String
        cell.idLabel.text = dicForCell["city"] as? String
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {

        if editingStyle == .Delete
        {
            let url = "https://sheetsu.com/apis/1261d3fb/\(self.jsonArray[indexPath.row])"
            Alamofire.request(.DELETE, url)
            
            alamofireGET()
        }
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
