//
//  ProfileViewController.swift
//  Instappa
//
//  Created by Edwin M. Rivera on 3/6/16.
//  Copyright © 2016 CodePath Marky. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {

  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onLogout(sender: AnyObject) {
        print("User logged out")
        PFUser.logOut()
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
