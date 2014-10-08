//
//  DashboardViewController.swift
//  WalkPool
//
//  Created by Sara  on 10/6/14.
//  Copyright (c) 2014 Sara Menefee. All rights reserved.
//

import UIKit
import MapKit

class DashboardViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var mapView: MKMapView!
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
        
        // 1
        let location = CLLocationCoordinate2D(
            latitude: 37.7816940,
            longitude: -122.4105220
        )
        // 2
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        //3
        let annotation = MKPointAnnotation()
        annotation.setCoordinate(location)
        annotation.title = "You are here"
        annotation.subtitle = "This is your current location"
        mapView.addAnnotation(annotation)
    }
    
    

    @IBAction func onTapDismiss(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
