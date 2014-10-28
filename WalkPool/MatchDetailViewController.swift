//
//  MatchDetailViewController.swift
//  WalkPool
//
//  Created by Corin Nader on 10/20/14.
//  Copyright (c) 2014 Sara Menefee. All rights reserved.
//

import UIKit

class MatchDetailViewController: UIViewController, UIViewControllerTransitioningDelegate {

    
    @IBOutlet weak var walkBuddyScore: UILabel!
    @IBOutlet weak var aboutMeText: UILabel!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var buddyScrollView: UIScrollView!
    
    let blue = UIColor(red: 90/255, green: 181/255, blue: 211/255, alpha: 1)
    let gray = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buddyScrollView.contentSize = CGSize(width: 320, height: 490)
        
        aboutMeText.textColor = blue
        walkBuddyScore.textColor = blue
        
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
        
        performSegueWithIdentifier("routeToSegue", sender: nil)
//        dismissViewControllerAnimated(true, completion: { () -> Void in
//            
//            
//        })
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
