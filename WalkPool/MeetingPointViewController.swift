//
//  MeetingPointViewController.swift
//  WalkPool
//
//  Created by Sara  on 10/22/14.
//  Copyright (c) 2014 Sara Menefee. All rights reserved.
//

import UIKit

class MeetingPointViewController: UIViewController {

    @IBOutlet weak var waitingForApprovalLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var magicFog: UIView!

    
    @IBOutlet weak var readyToGoButton: UIButton!
    @IBOutlet weak var walkCompletedButton: UIButton!
    @IBOutlet weak var loadingImg: UIImageView!
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var navigate0: UIButton!
    @IBOutlet weak var navigate1: UIButton!
    @IBOutlet weak var navigate2: UIButton!
    @IBOutlet weak var navigate3: UIButton!
    
    @IBOutlet weak var mapImage: UIImageView!
    @IBOutlet weak var cancelWalkButton: UIButton!
    @IBOutlet weak var currentLocationArrowImage: UIImageView!
    @IBOutlet weak var currentLocationDotImage: UIImageView!
    @IBOutlet weak var emilyPinButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmButton.alpha = 0
        walkCompletedButton.alpha = 0
        readyToGoButton.alpha = 0
        cancelWalkButton.alpha = 0
        messageLabel.text = "Route to meeting point"
        mapImage.image = UIImage(named: "map-meeting-point.png")
        loadingImg.hidden = true
        currentLocationDotImage.hidden = true
        activityIndicator.startAnimating()
        magicFog.hidden = false
        waitingForApprovalLabel.hidden = false
        navigate0.alpha = 1
        navigate1.alpha = 0
        navigate2.alpha = 0
        navigate3.alpha = 0
        

        
        // Waiting for Emily to approve request
        delay(5) {
            UIView.animateWithDuration(0.8, animations: { () -> Void in
                self.activityIndicator.stopAnimating()
                self.waitingForApprovalLabel.text = "Emily approved your request!"
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
    
    // Navigate to meeting point
    @IBAction func onNavigate0(sender: AnyObject) {
        println("onNextInstruction")
        self.mapImage.image = UIImage(named: "map-meeting-point.png")
        loadingImg.hidden = true
        navigate0.alpha = 1
        navigate0.enabled = false
        
        // Animate arrow to meeting point
        UIView.animateWithDuration(6, animations: { () -> Void in
            self.currentLocationArrowImage.frame.origin = CGPoint(x: 95 , y: 214)
        })
        
        // Animate Emily to cross the street
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
                self.navigate0.alpha = 0
                self.confirmButton.alpha = 1
                self.currentLocationArrowImage.hidden = true
                self.currentLocationDotImage.frame.origin = CGPoint(x: 95 , y: 214)
                self.currentLocationDotImage.hidden = false
            })
        }
        
    }
    
    // Clicking confirm arrival
    @IBAction func confirmArrivalButton(sender: AnyObject) {
        
        // You have arrived but waiting for Emily
        self.messageLabel.text = "Emily is still en route"
        navigate1.alpha = 0
        confirmButton.alpha = 0
        loadingImg.hidden = false
        
        loadingDots(1)
        
        // Animate Emily to cross the street
        UIView.animateWithDuration(6, animations: { () -> Void in
            self.emilyPinButton.frame.origin = CGPoint(x: 124, y: 209 )
        })
        
        // Emily has arrived
        delay(6) {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.loadingImg.hidden = true
                self.readyToGoButton.alpha = 1
                self.messageLabel.text = "Emily has arrived!"
            })
        }

        println("confirmArrivalButton")
    }
    
    // Clicking ready to go button
    @IBAction func readyToGoButton(sender: AnyObject) {
        self.mapImage.image = UIImage(named: "map-final-destinations.png")
        self.messageLabel.text = "Route to 989 Market Street"
        self.loadingImg.hidden = true
        self.readyToGoButton.hidden = true
        self.emilyPinButton.hidden = true
        self.currentLocationDotImage.hidden = true
        self.currentLocationArrowImage.hidden = false
        self.currentLocationArrowImage.frame.origin = CGPoint(x: 165, y: 242 )
        walkCompletedButton.alpha = 0
        navigate1.alpha = 1

        println("readyToGoButton")
    }
    
    // -------------
    // Navigation to final destination
    // -------------
    // Clean up redundancy later
    
    @IBAction func onNavigate1(sender: AnyObject) {
        navigate1.enabled = false
        
        // Animate arrow to the corner of Mission and 6th
        UIView.animateWithDuration(6, animations: { () -> Void in
            self.currentLocationArrowImage.frame.origin = CGPoint(x: 110, y: 276 )
        })
        
        delay(5) {
            UIView.animateWithDuration(2, animations: { () -> Void in
                self.navigate1.alpha = 0
                self.navigate2.alpha = 1
            })
        }
        
        // Rotate arrow
        delay(6) {
            UIView.animateWithDuration(1, animations: { () -> Void in
                self.currentLocationArrowImage.transform = CGAffineTransformRotate(self.currentLocationArrowImage.transform, (CGFloat(90 * M_PI / 180)))
            })
        }
    }
    
    @IBAction func onNavigate2(sender: AnyObject) {
        navigate2.enabled = false
        
        // Animate arrow to corner of 6th and Market
        UIView.animateWithDuration(6, animations: { () -> Void in
            self.currentLocationArrowImage.frame.origin = CGPoint(x: 26, y: 188 )
        })
        
        delay(5) {
            UIView.animateWithDuration(2, animations: { () -> Void in
                self.navigate2.alpha = 0
                self.navigate3.alpha = 1
            })
        }
        
        // Rotate arrow
        delay(6) {
            UIView.animateWithDuration(1, animations: { () -> Void in
                self.currentLocationArrowImage.transform = CGAffineTransformRotate(self.currentLocationArrowImage.transform, (CGFloat(90 * M_PI / 180)))
            })
        }
        
    }
    
    @IBAction func onNavigate3(sender: AnyObject) {
        navigate3.enabled = false
        
        // Animate arrow to corner of 6th and Market
        UIView.animateWithDuration(2, animations: { () -> Void in
            self.currentLocationArrowImage.frame.origin = CGPoint(x: 47, y: 172 )
            self.navigate2.alpha = 0
        })
        
        delay(2) {
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.walkCompletedButton.alpha = 1
                self.navigate3.alpha = 0
                self.messageLabel.text = "You have arrived!"
            })
        }
        
    }
    
    // Loading dots
    func loadingDots(duration: NSTimeInterval){
        var imagesLoading = UIImage.animatedImageNamed("loading-", duration: duration)
        loadingImg.image = imagesLoading
    }

    @IBAction func cancelWalkButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        println("cancel walk button")

    }
    
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
