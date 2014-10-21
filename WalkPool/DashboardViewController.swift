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

    @IBOutlet weak var findButton: UIButton!
    @IBOutlet var mapView: MKMapView!
    var locationManager: CLLocationManager!
    var showsUserLocation : Bool!
    var userLocationVisibile : Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        let location2 = CLLocationCoordinate2D(
            latitude: 37.7823944,
            longitude: -122.4098401
        )
        
        let span2 = MKCoordinateSpanMake(0.05, 0.05)
        let region2 = MKCoordinateRegion(center: location2, span: span2)
        mapView.setRegion(region2, animated: true)
        
        let annotation2 = MKPointAnnotation()
        annotation2.setCoordinate(location2)
        annotation2.title = "Zendesk"
        annotation2.subtitle = "Corin"
        
        if findButton.tag == 0 {
            //Add Annotation
            println("Add Annotation")
            findButton.tag = 1
            mapView.addAnnotation(annotation2)
        } else if findButton.tag == 1 {
            //Remove Annotation
            println("Remove Annotation")
            findButton.tag = 0
            mapView.removeAnnotation(annotation2)
        }
        
        
    }

    @IBAction func onTapDismiss(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
