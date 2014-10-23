//
//  MeetingPointViewController.swift
//  WalkPool
//
//  Created by Sara  on 10/22/14.
//  Copyright (c) 2014 Sara Menefee. All rights reserved.
//

import UIKit

class MeetingPointViewController: UIViewController {

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
        meetingAlert.hidden = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func navigationArrivedMap(){
        self.mapImage.image = UIImage(named: "navigationarrived.png")
    }
    
    @IBAction func onNextInstrution(sender: AnyObject) {
        navigationArrivedMap()
        directions1.hidden = true
        greyChevron.hidden = true
        rendezvousMessage.hidden = true
        
        confirmButton.hidden = false
        arrivedMessage.hidden = false
    }
    
    @IBAction func confirmArrivalButton(sender: AnyObject) {
        
        
    }
    
    @IBAction func onDismissDirections(sender: AnyObject) {
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
