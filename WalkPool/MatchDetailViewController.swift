//
//  MatchDetailViewController.swift
//  WalkPool
//
//  Created by Corin Nader on 10/20/14.
//  Copyright (c) 2014 Sara Menefee. All rights reserved.
//

import UIKit

class MatchDetailViewController: UIViewController, UIViewControllerTransitioningDelegate {

    
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var buddyScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        buddyScrollView.contentSize = CGSize(width: 320, height: 490)
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCloseButton(sender: AnyObject) {
       dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func onMeetButton(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: { () -> Void in
            // Change something in the dashboard view controller
            
        })
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
