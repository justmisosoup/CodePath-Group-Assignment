//
//  RatingViewController.swift
//  WalkPool
//
//  Created by Sara  on 10/28/14.
//  Copyright (c) 2014 Sara Menefee. All rights reserved.
//

import UIKit

class RatingViewController: UIViewController {

    @IBOutlet weak var ratingScore: UILabel!
    @IBOutlet weak var headerRatings: UILabel!
    @IBOutlet weak var overallScore: UILabel!
    @IBOutlet weak var badRatings: UILabel!
    @IBOutlet weak var goodRatings: UILabel!
    
    let blue = UIColor(red: 90/255, green: 181/255, blue: 211/255, alpha: 1)
    let gray = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()

       ratingScore.textColor = gray
       goodRatings.textColor = blue
        badRatings.textColor = blue
        overallScore.textColor = blue
        headerRatings.textColor = gray
    
        
    }


    @IBAction func pressDismiss(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}