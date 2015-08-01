//
//  DashboardViewController.swift
//  WalkPool
//
//  Created by Sara  on 10/6/14.
//  Copyright (c) 2014 Sara Menefee. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class DashboardViewController: UIViewController, UITextFieldDelegate, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var destinationPoint: UITextField!
    @IBOutlet weak var startingPoint: UITextField!
    @IBOutlet weak var findButton: UIButton!
    @IBOutlet weak var pinJamesButton: UIButton!
    @IBOutlet weak var pinEmilyButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var mapImage: UIImageView!
    @IBOutlet weak var dashboardView: UIView!
    //@IBOutlet weak var meetingPointButton: UIButton!

    var matchDetailViewController: UIViewController!
    var isPresenting: Bool = true
    
    let blue = UIColor(red: 90/255, green: 181/255, blue: 211/255, alpha: 1)
    let gray = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        findButton.enabled = true
        destinationPoint.delegate = self
        startingPoint.delegate = self
        
        startingPoint.text = "Current Location"
        startingPoint.textColor = blue
        
        destinationPoint.textColor = gray
        
        currentLocationMap()
        
        containerView.hidden = true
        //meetingPointButton.hidden = true
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        matchDetailViewController = storyboard.instantiateViewControllerWithIdentifier("MatchDetailViewController") as!UIViewController
    
    }
    
    @IBAction func onTapDismissKeyboard(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

  
    @IBAction func onFind(sender: AnyObject) {
        var alertView2 = UIAlertView(title: "Searching...", message: nil, delegate: self, cancelButtonTitle: nil)
        alertView2.show()
        
        delay(1, closure: { () -> () in
            
            // Locations are Correct! Will return images
            if(self.startingPoint.text == "Current Location" ) && (self.destinationPoint.text == "989 Market Street") {
                alertView2.dismissWithClickedButtonIndex(0, animated: true)
                
                self.destintationMapMatches()
                
             }
                
            // Destination is Empty! Will return images
            else if(self.startingPoint.text == "Current Location" ) && (self.destinationPoint.text.isEmpty) {
                alertView2.dismissWithClickedButtonIndex(0, animated: true)
                UIAlertView(title: "Whoops!", message: "In order to find walking buddies, you need to indicate a destination.", delegate: nil, cancelButtonTitle: "Try Again...").show()
                
                self.currentLocationMap()
                
            }
                
            // Destination is Empty! Will not return results
            
            else if(self.startingPoint.text.isEmpty ) && (self.destinationPoint.text == "989 Market Street") {
                alertView2.dismissWithClickedButtonIndex(0, animated: true)
                self.startingPoint.text = "Current Location"
                
                self.destintationMapMatches()
                
            }
                
             // Locations are Wrong! Will not return results
            else {
                alertView2.dismissWithClickedButtonIndex(0, animated: true)
                UIAlertView(title: "Yikes!", message: "Where do you think you are? Your destination does not exist!", delegate: nil, cancelButtonTitle: "Try Again...").show()
                
                self.currentLocationMap()
                
            }
            
        })

    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        self.destintationMapMatches()
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        
        if (isPresenting) {
            // Intro segue
            println("intro segue")
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            // Outro segue
            println("outro segue")
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
                    
            }
        }
    }

    // Buddy Icon Tap Selection
    
    @IBAction func onPinButton(sender: UIButton) {
        performSegueWithIdentifier("matchDetailSegue", sender: self)
    }

    // "Navigate to meeting point" Tap Selection
    
    
    // Keyboard enter
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        destinationPoint.resignFirstResponder()
        startingPoint.resignFirstResponder()
        
        // Call same action function as button "Find Walking Buddy"
        onFind(self)
        
        return true
    }
    
    // Show map with 989 destination and drop pins
    func destintationMapMatches(){
        self.mapImage.image = UIImage(named: "map-address-entered.png")
        UIView.animateWithDuration(0.7, delay: 0.5, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: nil, animations: { () -> Void in
        self.pinJamesButton.frame.origin.y = CGFloat(141)
        self.pinEmilyButton.frame.origin.y = CGFloat(270)
        
        }, completion: { (finished: Bool) -> Void in
        })
    }
    
    // Show map of current location and move pins off screen
    func currentLocationMap(){
        self.mapImage.image = UIImage(named: "map-current-location.png")
        pinJamesButton.frame.origin.y = CGFloat(-200)
        pinEmilyButton.frame.origin.y = CGFloat(-200)
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }


    @IBAction func onTapDismiss(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "matchDetailSegue") {
            var destinationViewController = segue.destinationViewController as! MatchDetailViewController
            destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
            destinationViewController.transitioningDelegate = self
            
        }
//        else if (segue.identifier == "pinkSegue"){
//            var destinationViewController = segue.destinationViewController as UIViewController
//            destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
//            destinationViewController.transitioningDelegate = self
//        }
        
        
        
    }

    
}
