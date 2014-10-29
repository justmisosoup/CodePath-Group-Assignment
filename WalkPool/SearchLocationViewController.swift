//
//  SearchLocationViewController.swift
//  WalkPool
//
//  Created by Sara  on 10/29/14.
//  Copyright (c) 2014 Sara Menefee. All rights reserved.
//

import UIKit

protocol EditLocationViewControllerDelegate {
    func returnWithLocation(location:String)
}

class SearchLocationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var locationTableView: UITableView!
    @IBOutlet weak var destinationSearch: UITextField!
    
    var delegate: EditLocationViewControllerDelegate?
    var location: [NSDictionary] = []
    var oneSec: NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationTableView.delegate = self
        locationTableView.dataSource = self
        
        destinationSearch.becomeFirstResponder()

    }
    
    @IBAction func displayResults(sender: UITextField) {
        oneSec?.invalidate()
        oneSec = NSTimer.scheduledTimerWithTimeInterval(0.5,
            target: self,
            selector: Selector("displayLocations"),
            userInfo: nil,
            repeats: false)
    }
    
    func displayLocations() {
        var urlSafe = self.destinationSearch.text.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        var api = NSURL(string: "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=\(urlSafe)&key=AIzaSyCYjN3ksYmWdb23xZ0mTkHFeiAz16LoROU")
        var request = NSURLRequest(URL: api)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
            if error != nil {
                println("Error occured!")
            } else  {
                var objects = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary
                
                self.location = objects["predictions"] as [NSDictionary]
                self.locationTableView.reloadData()
                
            }
        }
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var cell = tableView.cellForRowAtIndexPath(indexPath) as LocationCell!
        var place = cell.locationLabel.text!
        
        delegate?.returnWithLocation(place)
        
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return location.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("LocationCell") as LocationCell
        var locations = location[indexPath.row]
        cell.locationLabel.text = (locations["description"] as String)
        
        return cell
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
