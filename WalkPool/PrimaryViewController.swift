//
//  PrimaryViewController.swift
//  WalkPool
//
//  Created by Sara Menefee on 10/14/14.
//  Copyright (c) 2014 Sara Menefee. All rights reserved.
//

import UIKit

class PrimaryViewController: UIViewController {

    @IBOutlet weak var dashboardContainerView: UIView!
    @IBOutlet weak var menuContainerView: UIView!
    
    var menuViewController: UIViewController!
    var dashboardViewController: UIViewController!
    var accountViewController:UIViewController!
    var imageCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        dashboardViewController = storyboard.instantiateViewControllerWithIdentifier("DashboardViewController") as UIViewController
        menuViewController = storyboard.instantiateViewControllerWithIdentifier("MenuViewController") as UIViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as UIViewController

                
        menuContainerView.addSubview(menuViewController.view)
        dashboardContainerView.addSubview(dashboardViewController.view)
        
        menuContainerView.transform = CGAffineTransformMakeScale(0.9, 0.9)

        
    }


    @IBAction func onPanRevealMenu(gestureRecognizer: UIPanGestureRecognizer) {
        
        var translation = gestureRecognizer.translationInView(view)
        var velocity = gestureRecognizer.velocityInView(view)
        var location = gestureRecognizer.locationInView(view)
        var offset = Float(dashboardContainerView.center.x)
        
        var scaleIn = convertValue(dashboardContainerView.frame.origin.x, r1Min: 0.0, r1Max: 280.0, r2Min: 0.9, r2Max: 1.0)
        menuContainerView.transform = CGAffineTransformMakeScale(scaleIn, scaleIn)
        
        if gestureRecognizer.state == UIGestureRecognizerState.Began {
            println("Began")
            menuContainerView.hidden = false
            imageCenter = dashboardContainerView.center
            
        } else if gestureRecognizer.state == UIGestureRecognizerState.Changed {
            println("Changed \(location.x)")
            dashboardContainerView.center.x = translation.x + imageCenter.x
            
            if location.x < 250 {
            }
            
        } else if gestureRecognizer.state == UIGestureRecognizerState.Ended {
            println("Ended")
            if velocity.x > -40 {
                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: nil, animations: { () -> Void in
                    self.dashboardContainerView.center.x = 420
                    self.menuContainerView.transform = CGAffineTransformMakeScale(1, 1)
                    }, completion: { (finished: Bool) -> Void in
                })
            } else {
                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: nil, animations: { () -> Void in
                    self.dashboardContainerView.center.x = 160
                    self.menuContainerView.transform = CGAffineTransformMakeScale(0.9, 0.9)
                    }, completion: nil)
            }
            
        }

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapDismissKeyboard(sender: AnyObject) {
        view.endEditing(true)
    }
    func convertValue(value: CGFloat, r1Min: CGFloat, r1Max: CGFloat, r2Min: CGFloat, r2Max: CGFloat) -> CGFloat {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }
    
    
}
