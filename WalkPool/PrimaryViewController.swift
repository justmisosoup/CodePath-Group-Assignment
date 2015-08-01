//
//  PrimaryViewController.swift
//  WalkPool
//
//  Created by Sara Menefee on 10/14/14.
//  Copyright (c) 2014 Sara Menefee. All rights reserved.
//

import UIKit

class PrimaryViewController: UIViewController, UIAlertViewDelegate {

    @IBOutlet weak var dashboardContainerView: UIView!
    @IBOutlet weak var menuContainerView: UIView!
    @IBOutlet weak var menuButton: UIButton!
    
    var menuViewController: UIViewController!
    var dashboardViewController: DashboardViewController!
    var accountViewController:UIViewController!
    var matchDetailViewController:UIViewController!
    var imageCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        dashboardViewController = storyboard.instantiateViewControllerWithIdentifier("DashboardViewController") as!DashboardViewController
        menuViewController = storyboard.instantiateViewControllerWithIdentifier("MenuViewController") as! UIViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as! UIViewController
//        matchDetailViewController = storyboard.instantiateViewControllerWithIdentifier("MatchDetailViewController") as UIViewController
        
        
        menuViewController.willMoveToParentViewController(self)
        self.addChildViewController(menuViewController)
        menuContainerView.addSubview(menuViewController.view)
        menuViewController.didMoveToParentViewController(self)
        
        dashboardViewController.willMoveToParentViewController(self)
        self.addChildViewController(dashboardViewController)
        dashboardContainerView.addSubview(dashboardViewController.view)
        dashboardViewController.didMoveToParentViewController(self)
        
        menuContainerView.transform = CGAffineTransformMakeScale(0.9, 0.9)

    }
    

    
    @IBAction func walkCompleted(sender: UIStoryboardSegue) {
        var sourceViewController = sender.sourceViewController as! UIViewController
        
        if let checkMeetingPointViewController = sourceViewController as? MeetingPointViewController {
            dismissViewControllerAnimated(true, completion: nil)
            println("MEETING POINT IS COMING BACK")
            
            dashboardViewController.destinationPoint.text = ""
            dashboardViewController.startingPoint.text = "Current Location"
            dashboardViewController.currentLocationMap()
            showAlert()
        }
    }
    
    func showAlert(){
        var rateUser: UIAlertView = UIAlertView()
        
        rateUser.delegate = self
        
        rateUser.title = "How would you rate Emily?"
        rateUser.message = "We'd like to know so we can keep other Walkpoolers safe and happy!"
        rateUser.addButtonWithTitle("Great")
        rateUser.addButtonWithTitle("Not so Great")
        rateUser.addButtonWithTitle("No Opinion")
        
        rateUser.show()
    }
    
    var confirmationAlert = UIAlertView(title: "Thanks for rating Emily!", message: nil, delegate: nil, cancelButtonTitle:  nil)
    
        func alertView(View: UIAlertView!, clickedButtonAtIndex buttonIndex: Int){
    
            switch buttonIndex{
    
            case 0:
                    NSLog("Great");
                    confirmationAlert.show()
                    
                    delay(1.5) {
                        self.confirmationAlert.dismissWithClickedButtonIndex(0, animated: true)
                    }
            break;
            case 1:
                NSLog("Not so Great");
                confirmationAlert.show()
                
                delay(1.5) {
                    self.confirmationAlert.dismissWithClickedButtonIndex(0, animated: true)
                }
            break;
    
            case 2:
                NSLog("No Opinion");
                confirmationAlert.show()
                
                delay(2) {
                    self.confirmationAlert.dismissWithClickedButtonIndex(0, animated: true)
                }
                
            break;
            
            default:
                println("durp")
            }
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
        println("tap keyboard")
    }
    func convertValue(value: CGFloat, r1Min: CGFloat, r1Max: CGFloat, r2Min: CGFloat, r2Max: CGFloat) -> CGFloat {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
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
