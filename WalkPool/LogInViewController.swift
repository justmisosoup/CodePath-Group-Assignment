//
//  LogInViewController.swift
//  WalkPool
//
//  Created by Sara  on 10/8/14.
//  Copyright (c) 2014 Sara Menefee. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var formView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formView.alpha = 0

        // Do any additional setup after loading the view.
    }

    @IBAction func onClickButton(sender: AnyObject) {

        formView.alpha = 0
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
