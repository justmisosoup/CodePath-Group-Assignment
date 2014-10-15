//
//  LogInViewController.swift
//  WalkPool
//
//  Created by Sara  on 10/8/14.
//  Copyright (c) 2014 Sara Menefee. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController, UIAlertViewDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var formView: UIView!
    
    // Prompt UIAlertView when signInBtn is tapped
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formView.alpha = 1

        // Do any additional setup after loading the view.
    }

    @IBAction func onClickSignIn(sender: AnyObject) {
        
        // When tapping "Sign In" display appropriate UIAlertView depending on conditions
        
        var alertView = UIAlertView(title: "Logging in...", message: nil, delegate: self, cancelButtonTitle: nil)
        alertView.show()
        
        delay(2, closure: { () -> () in
            
            // Credentials were correct UIAlertView!
            
            if(self.emailTextField.text == "sara@menef.ee" ) && (self.passwordTextField.text == "password") {
                alertView.dismissWithClickedButtonIndex(0, animated: true)
                self.performSegueWithIdentifier("logInSegue", sender: self)
                
            }
                
            // Credentials were empty UIAlertView!
                
            else if(self.emailTextField.text.isEmpty ) && (self.passwordTextField.text.isEmpty) {
                alertView.dismissWithClickedButtonIndex(0, animated: true)
                UIAlertView(title: "Whoops!", message: "You need to enter in an email and password to log-in.", delegate: nil, cancelButtonTitle: "Try Again...").show()
                
            }
                
                // Credentials were wrong UIAlertView!
                
            else {
                alertView.dismissWithClickedButtonIndex(0, animated: true)
                UIAlertView(title: "Uh oh!", message: "Your log-in credentials were wrong!", delegate: nil, cancelButtonTitle: "Try Again...").show()
            }
            
        })

        
        }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapDismissKeyboard(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
}
