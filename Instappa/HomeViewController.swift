//
//  HomeViewController.swift
//  Instappa
//
//  Created by Edwin M. Rivera on 3/6/16.
//  Copyright © 2016 CodePath Marky. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var post: [PFObject]?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        getPosts { (posts, error) -> Void in
            self.post = posts
            self.tableView.reloadData()
        }
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "refreshControlAction:", forControlEvents: UIControlEvents.ValueChanged)
        tableView.insertSubview(refreshControl, atIndex: 0)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if post?.count>0 {
            return (post?.count)!
        }else {
            return 0
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PostCell", forIndexPath: indexPath) as! PostCell
        let data = post?[indexPath.row]
        cell.instaPost = data
        return cell
        
        
    }
    
    func getPosts(completion: (posts: [PFObject]?, error: NSError?)-> Void){
        let query = PFQuery(className: "Post")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        query.findObjectsInBackgroundWithBlock { (posts: [PFObject]?, error: NSError?) -> Void in
            if let posts = posts {
                completion(posts: posts, error: nil)
            } else {
                print("failed to get data")
            }
        }
        self.tableView.reloadData()

    }
    
    func refreshControlAction(refreshControl: UIRefreshControl) {
        //Connect to the API to have the last update
        getPosts { (posts, error) -> Void in
            self.post = posts
            self.tableView.reloadData()
        }
        
        //update the collection data source
        refreshControl.endRefreshing()
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
