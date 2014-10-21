//
//  AccountViewController.swift
//  WalkPool
//
//  Created by Corin Nader on 10/19/14.
//  Copyright (c) 2014 Sara Menefee. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var aboutMe: UILabel!
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var buddyScore: UILabel!
    @IBOutlet weak var aboutMeDescription: UITextView!
    @IBOutlet weak var buddyRating: UILabel!
    
    var isPresenting: Bool = true
    
    let blue = UIColor(red: 90/255, green: 181/255, blue: 211/255, alpha: 1)
    let gray = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        aboutMe.textColor = blue
        nameText.textColor = gray
        buddyScore.textColor = blue
        buddyRating.textColor = gray

        scrollView.contentSize = containerView.frame.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onBackButton(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
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
