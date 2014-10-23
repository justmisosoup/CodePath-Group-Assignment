//
//  MeetingPointViewController.swift
//  WalkPool
//
//  Created by Sara  on 10/22/14.
//  Copyright (c) 2014 Sara Menefee. All rights reserved.
//

import UIKit

class MeetingPointViewController: UIViewController {

    @IBOutlet weak var emilyArrivedMsg: UILabel!
    @IBOutlet weak var readyToGoButton: UIButton!
    @IBOutlet weak var loadingImg: UIImageView!
    @IBOutlet weak var emilyEnRoute: UILabel!
    @IBOutlet weak var arrivedMessage: UILabel!
    @IBOutlet weak var rendezvousMessage: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var directions1: UILabel!
    @IBOutlet weak var greyChevron: UIButton!
    @IBOutlet weak var mapImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmButton.hidden = true
        arrivedMessage.hidden = true
        directions1.hidden = false
        greyChevron.hidden = false
        rendezvousMessage.hidden = false
        loadingImg.hidden = true
        emilyEnRoute.hidden = true
        readyToGoButton.hidden = true
        emilyArrivedMsg.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onNextInstrution(sender: AnyObject) {
        navigationArrivedMap()
        directions1.hidden = true
        greyChevron.hidden = true
        rendezvousMessage.hidden = false
        loadingImg.hidden = false

        var images = UIImage.animatedImageNamed("loading-", duration: 1)
        loadingImg.image = images
        
        delay(4) {
            self.emilyArrived()
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.rendezvousMessage.hidden = true
                self.loadingImg.hidden = true
                self.confirmButton.hidden = false
                self.arrivedMessage.hidden = false
            })
        }
        
    }
    
    @IBAction func confirmArrivalButton(sender: AnyObject) {
      navigationRouteGroup()
        directions1.hidden = true
        greyChevron.hidden = true
        rendezvousMessage.hidden = true
        confirmButton.hidden = true
        arrivedMessage.hidden = true
        emilyEnRoute.hidden = false
        loadingImg.hidden = false
        
        var images = UIImage.animatedImageNamed("loading-", duration: 1)
        loadingImg.image = images
        
        delay(8) {
            self.emilyArrived()
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.loadingImg.hidden = true
                self.emilyEnRoute.hidden = true

                self.readyToGoButton.hidden = false
                self.emilyArrivedMsg.hidden = false
            })
        }
        
    }
    
    func emilyArrived(){
        self.mapImage.image = UIImage(named: "navigationarrived.png")
    }
    
    func navigationRouteGroup(){
        self.mapImage.image = UIImage(named: "map-current-location.png")
    }
    
    func navigationArrivedMap(){
        self.mapImage.image = UIImage(named: "navigationarrived.png")
    }
    
    @IBAction func onDismissDirections(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
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
