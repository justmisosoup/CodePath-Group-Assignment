//
//  LogInViewController.swift
//  WalkPool
//
//  Created by Sara  on 10/8/14.
//  Copyright (c) 2014 Sara Menefee. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController, UIAlertViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var subContent: UITextView!
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var formView: UIView!
    @IBOutlet weak var buttonView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formView.alpha = 1
        subContent.alpha = 1
        logoImg.alpha = 1
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

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
                
            else if(self.emailTextField.text == "corin.nader@gmail.com" ) && (self.passwordTextField.text == "password") {
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
    
    // From password field keyboard enter logs in
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        passwordTextField.resignFirstResponder()

        
        if (textField == emailTextField) {
            passwordTextField.becomeFirstResponder()
        }else if (textField == passwordTextField) {
            passwordTextField.resignFirstResponder()
            onClickSignIn(self)
            self.subContent.alpha = 0
            self.logoImg.alpha = 0
            
            // how to grab the keyboard animation here
            //keyboardWillShow(notification: NSNotification!)
        }
        
        
        return true
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        formView.tag = Int(self.formView.frame.origin.y)
        buttonView.tag = Int(self.buttonView.frame.origin.y)
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {
                        self.subContent.alpha = 0
                        self.logoImg.alpha = 0
                        self.formView.frame.origin.y = -100;
                        self.buttonView.frame.origin.y = 190;
            
            
            }, completion: nil)
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {
                        self.subContent.alpha = 1
                        self.logoImg.alpha = 1
                        self.formView.frame.origin.y = CGFloat(self.formView.tag);
                        self.buttonView.frame.origin.y = CGFloat(self.buttonView.tag);
            
            }, completion: nil)
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
