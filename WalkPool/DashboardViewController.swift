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

class DashboardViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var mapView: MKMapView!
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.showsUserLocation = true
        
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
  

    @IBAction func onTapDismiss(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
