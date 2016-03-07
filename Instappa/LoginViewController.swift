//
//  LoginViewController.swift
//  Instappa
//
//  Created by Edwin M. Rivera on 3/5/16.
//  Copyright © 2016 CodePath Marky. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var userTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignIn(sender: AnyObject) {
       
        PFUser.logInWithUsernameInBackground(userTextField.text!, password: passTextField.text!) { (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                print("You've logged in")
                
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            }
        }
        
    }

    @IBAction func onSignUp(sender: AnyObject) {
        let newUser = PFUser()
        
        newUser.username = userTextField.text
        newUser.password = passTextField.text
        
        newUser.signUpInBackgroundWithBlock{ (success:Bool, error: NSError?) -> Void in
            if success {
                print("Yay, created a user!")
                
                self.performSegueWithIdentifier("loginSegue", sender: nil)
                
            } else{ print(error?.localizedDescription)
                if error?.code == 202 {
                    print("Username is taken")
                }
            }
        }
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
