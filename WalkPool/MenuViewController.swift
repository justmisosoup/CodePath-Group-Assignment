//
//  MenuViewController.swift
//  WalkPool
//
//  Created by Sara Menefee on 10/14/14.
//  Copyright (c) 2014 Sara Menefee. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    var accountViewController:UIViewController!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as UIViewController

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onLogOut(sender: AnyObject) {
        
        delay(3){
            self.performSegueWithIdentifier("logoutSegue", sender: self)
        }
}
    
    @IBAction func onProfileButton(sender: UIButton) {
        performSegueWithIdentifier("AccountSegue", sender: self)
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
