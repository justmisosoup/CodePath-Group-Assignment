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
    
    var isPresenting: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()

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
