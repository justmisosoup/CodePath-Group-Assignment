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

class DashboardViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var destinationPoint: UITextField!
    @IBOutlet weak var startingPoint: UITextField!
    @IBOutlet weak var findButton: UIButton!
    @IBOutlet var mapView: MKMapView!
    @IBOutlet weak var mapImage: UIImageView!
    @IBOutlet weak var pinJamesImage: UIButton!
    @IBOutlet weak var pinEmilyImage: UIButton!
    
    var locationManager: CLLocationManager!
    var showsUserLocation : Bool!
    var userLocationVisibile : Bool!
    
    let blue = UIColor(red: 90/255, green: 181/255, blue: 211/255, alpha: 1)
    let gray = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        destinationPoint.delegate = self
        startingPoint.delegate = self
        
        startingPoint.text = "Current Location"
        startingPoint.textColor = blue
        
        destinationPoint.textColor = gray
        pinJamesImage.frame.origin.y = CGFloat(-200)
        pinEmilyImage.frame.origin.y = CGFloat(-1800)
        
//        showsUserLocation = true
//        userLocationVisibile = true
        
        // Location 1
        
//        let location1 = CLLocationCoordinate2D(
//            latitude: 37.7816542,
//            longitude: -122.4078745
//        )
//
//        let span1 = MKCoordinateSpanMake(0.05, 0.05)
//        let region1 = MKCoordinateRegion(center: location1, span: span1)
//        mapView.setRegion(region1, animated: true)
//        
//        let annotation1 = MKPointAnnotation()
//        annotation1.setCoordinate(location1)
//        annotation1.title = "IndieGoGo"
//        annotation1.subtitle = "CodePath"
//        mapView.addAnnotation(annotation1)
//        
//        func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
//            let location = locations.last as CLLocation
//            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
//            self.mapView.setRegion(region, animated: true)
//        }
        
//        CLLocationManager.requestAlwaysAuthorization("Always be calling your location!")

    }
    

    @IBAction func onTapDismissKeyboard(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
  
    @IBAction func onFind(sender: AnyObject) {
        var alertView = UIAlertView(title: "Searching...", message: nil, delegate: self, cancelButtonTitle: nil)
        alertView.show()
        
        delay(1, closure: { () -> () in
            
            // Locations are Correct! Will return images.
            
            if(self.startingPoint.text == "Current Location" ) && (self.destinationPoint.text == "989 Market Street") {
                alertView.dismissWithClickedButtonIndex(0, animated: true)
                
                // Return image with complete route.
                // Drop buddy locations.
                self.destintationMapMatches()
                
                
                            }
                
            // Destination is Empty! Will return images.
                
            else if(self.startingPoint.text == "Current Location" ) && (self.destinationPoint.text.isEmpty) {
                alertView.dismissWithClickedButtonIndex(0, animated: true)
                UIAlertView(title: "Whoops!", message: "In order to find walking buddies, you need to indicate a destination.", delegate: nil, cancelButtonTitle: "Try Again...").show()
                
                // Return image with current location but no destination.
                // No buddy icons.
                // No destination point.
                // Technically won't change from originating image.
                self.currentLocationMap()
                
            }
                
            // Destination is Empty! Will not return results.
                
            else if(self.startingPoint.text.isEmpty ) && (self.destinationPoint.text == "989 Market Street") {
                alertView.dismissWithClickedButtonIndex(0, animated: true)
                self.startingPoint.text = "Current Location"
                
                // Return image with complete route.
                // Drop buddy locations.
                self.destintationMapMatches()
                
            }
                
             // Locations are Wrong! Will not return results.
                
            else {
                alertView.dismissWithClickedButtonIndex(0, animated: true)
                UIAlertView(title: "Yikes!", message: "Where do you think you are? Your destination does not exist!", delegate: nil, cancelButtonTitle: "Try Again...").show()
                
                // Return image with current location but no destination.
                // No buddy icons.
                // No destination point.
                // Technically won't change from originating image.
                self.currentLocationMap()
                
            }
            
        })

    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        destinationPoint.resignFirstResponder()
        startingPoint.resignFirstResponder()
        return true
    }
    
    func destintationMapMatches(){
        self.mapImage.image = UIImage(named: "map-989-market.png")
        UIView.animateWithDuration(0.7, delay: 0.5, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: nil, animations: { () -> Void in
        self.pinJamesImage.frame.origin.y = CGFloat(141)
        self.pinEmilyImage.frame.origin.y = CGFloat(232)
        
        }, completion: { (finished: Bool) -> Void in
        })
    }
    
    func currentLocationMap(){
        self.mapImage.image = UIImage(named: "map-current-location.png")
    }
    

    @IBAction func onTapDismiss(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
