//
//  MeetingPointViewController.swift
//  WalkPool
//
//  Created by Sara  on 10/22/14.
//  Copyright (c) 2014 Sara Menefee. All rights reserved.
//

import UIKit

class MeetingPointViewController: UIViewController {

    @IBOutlet weak var approvedConfirmation: UILabel!
    @IBOutlet weak var waitingForApproval: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var magicFog: UIView!

    
    @IBOutlet weak var readyToGoButton: UIButton!
    @IBOutlet weak var walkCompletedButton: UIButton!
    @IBOutlet weak var loadingImg: UIImageView!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var directions1: UILabel!
    @IBOutlet weak var greyChevron: UIButton!
    @IBOutlet weak var mapImage: UIImageView!
    @IBOutlet weak var cancelWalkButton: UIButton!
    @IBOutlet weak var currentLocationArrowImage: UIImageView!
    @IBOutlet weak var currentLocationDotImage: UIImageView!
    @IBOutlet weak var emilyPinButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmButton.hidden = true
        walkCompletedButton.alpha = 0
        readyToGoButton.hidden = true
        messageLabel.text = "Route to meeting point"
        directions1.hidden = false
        greyChevron.hidden = false
        loadingImg.hidden = true
        currentLocationDotImage.hidden = true
        approvedConfirmation.hidden = true
        activityIndicator.startAnimating()
        magicFog.hidden = false
        waitingForApproval.hidden = false
        cancelWalkButton.hidden = false
        
        delay(5) {
            UIView.animateWithDuration(0.8, animations: { () -> Void in
                self.activityIndicator.stopAnimating()
                self.approvedConfirmation.hidden = false
                self.waitingForApproval.hidden = true
                self.activityIndicator.hidden = true
            })
            
        }
        
        delay(7) {
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.magicFog.alpha = 0
            })
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Clicking chevron
    @IBAction func onNextInstruction(sender: AnyObject) {
        navigationArrivedMap()
        println("onNextInstruction")
    }
    
    // Clicking confirm arrival
    @IBAction func confirmArrivalButton(sender: AnyObject) {
        navigationRouteGroup()
        println("confirmArrivalButton")
    }
    
    // Clicking ready to go button
    @IBAction func readyToGoButton(sender: AnyObject) {
        navigationFinalDestination()
        println("readyToGoButton")
    }
    
    // Loading dots
    func loadingDots(duration: NSTimeInterval){
        var imagesLoading = UIImage.animatedImageNamed("loading-", duration: duration)
        loadingImg.image = imagesLoading
    }
    
    // Show loading image and animate current location arrow to meeting point, confirm arrival button appears
    func navigationArrivedMap(){
        self.mapImage.image = UIImage(named: "map-meeting-point.png")
        
        directions1.hidden = true
        greyChevron.hidden = true
        loadingImg.hidden = false
        
        loadingDots(1)
        
        // Animate arrow to meeting point
        UIView.animateWithDuration(6, animations: { () -> Void in
            self.currentLocationArrowImage.frame.origin = CGPoint(x: 95 , y: 214)
        })
        
        //Animate Emily to cross the street
        delay(3) {
            UIView.animateWithDuration(3, animations: { () -> Void in
                self.emilyPinButton.frame.origin = CGPoint(x: 63, y: 265 )
            })
        }
        
        // We see that you have arrived, confirm loaction button appears, current location arrow changes to dot
        delay(6) {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.messageLabel.text = "We see that you have arrived"
                self.loadingImg.hidden = true
                self.confirmButton.hidden = false
                self.currentLocationArrowImage.hidden = true
                self.currentLocationDotImage.frame.origin = CGPoint(x: 95 , y: 214)
                self.currentLocationDotImage.hidden = false
            })
        }

    }
    
    // You have arrived but waiting for Emily
    func navigationRouteGroup(){
        self.messageLabel.text = "Emily is still en route"
        directions1.hidden = true
        greyChevron.hidden = true
        confirmButton.hidden = true
        loadingImg.hidden = false
        
        loadingDots(1)
        
        //Animate Emily to cross the street
        UIView.animateWithDuration(6, animations: { () -> Void in
            self.emilyPinButton.frame.origin = CGPoint(x: 124, y: 209 )
        })
        
        // Emily has arrived
        delay(8) {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.loadingImg.hidden = true
                self.readyToGoButton.hidden = false
                self.messageLabel.text = "Emily has arrived!"
            })
        }
    }
    
    // We're both here, let's go!
    func navigationFinalDestination(){
        self.mapImage.image = UIImage(named: "map-final-destinations.png")
        self.messageLabel.text = "Route to final destination 989 Market Street"
        self.loadingImg.hidden = true
        self.readyToGoButton.hidden = true
        self.emilyPinButton.hidden = true
        self.walkCompletedButton.hidden = false
        self.walkCompletedButton.enabled = false
        self.currentLocationDotImage.hidden = true
        self.currentLocationArrowImage.hidden = false
        self.currentLocationArrowImage.frame.origin = CGPoint(x: 165, y: 242 )
        
    }

    
    @IBAction func cancelWalkButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        println("cancel walk button")

    }
    
    // Doesn't seem to be working
    @IBAction func onDismissDirections(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        println("on dismiss directions")
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
