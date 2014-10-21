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

class DashboardViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var destinationPoint: UITextField!
    @IBOutlet weak var startingPoint: UITextField!
    @IBOutlet weak var findButton: UIButton!
    @IBOutlet var mapView: MKMapView!
    var locationManager: CLLocationManager!
    var showsUserLocation : Bool!
    var userLocationVisibile : Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startingPoint.text = "Current Location"
        startingPoint.textColor = UIColor.blueColor()
        
        showsUserLocation = true
        userLocationVisibile = true
        // Location 1
        
        let location1 = CLLocationCoordinate2D(
            latitude: 37.7816542,
            longitude: -122.4078745
        )

        let span1 = MKCoordinateSpanMake(0.05, 0.05)
        let region1 = MKCoordinateRegion(center: location1, span: span1)
        mapView.setRegion(region1, animated: true)
        
        let annotation1 = MKPointAnnotation()
        annotation1.setCoordinate(location1)
        annotation1.title = "IndieGoGo"
        annotation1.subtitle = "CodePath"
        mapView.addAnnotation(annotation1)
        
        func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
            let location = locations.last as CLLocation
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            self.mapView.setRegion(region, animated: true)
        }
        
//        CLLocationManager.requestAlwaysAuthorization("Always be calling your location!")

    }
    

    @IBAction func onTapDismissKeyboard(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
  
    @IBAction func onFind(sender: AnyObject) {
        var alertView = UIAlertView(title: "Searching...", message: nil, delegate: self, cancelButtonTitle: nil)
        alertView.show()
        
        delay(2, closure: { () -> () in
            
            // Credentials were correct UIAlertView!
            
            if(self.startingPoint.text == "1019 Market Street" ) && (self.destinationPoint.text == "989 Market Street") {
                alertView.dismissWithClickedButtonIndex(0, animated: true)
                
            }
                
                // Credentials were empty UIAlertView!
                
            else if(self.startingPoint.text.isEmpty ) && (self.destinationPoint.text.isEmpty) {
                alertView.dismissWithClickedButtonIndex(0, animated: true)
                UIAlertView(title: "Whoops!", message: "You need to enter a valid location", delegate: nil, cancelButtonTitle: "Try Again...").show()
                
            }
            
        })

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
