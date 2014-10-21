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
    
    @IBAction func onProfileButton(sender: UIButton) {
        performSegueWithIdentifier("AccountSegue", sender: self)
         }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
