//
//  FirstViewController.swift
//  SunBlockMe
//
//  Created by Angel Baek on 5/26/15.
//  Copyright (c) 2015 Angel Baek. All rights reserved.
//

import UIKit
import CoreLocation

class FirstViewController: UIViewController, CLLocationManagerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var spfLabel: UILabel!
    @IBOutlet var spfText: UITextField!
    @IBOutlet weak var activityLabel: UILabel!
    let locationManager = CLLocationManager()
    func allSet(sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spfText.font = UIFont(name: "SUNN", size: 55.0)
        
    // Dismiss (num) keypad
        // 1. Tap anywhere
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: "didTapView")
        self.view.addGestureRecognizer(tapRecognizer)
        // 2. Swipe down
        var swipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "dismissKeyboard")
        swipe.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipe)
        
    // Current Location
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        if (spfText.text.isEmpty){
            let alert = UIAlertView()
            alert.title = "SPF Error"
            alert.message = "Please enter an SPF value"
            alert.addButtonWithTitle("OK")
            alert.show()
            return false
        } else if (spfText.text.toInt() > 100) {
            let alert = UIAlertView()
            alert.title = "SPF Error"
            alert.message = "Please enter an SPF value that's below 100"
            alert.addButtonWithTitle("OK")
            alert.show()
            return false
        } else {
            return true
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "segueTimer") {
            var svc = segue.destinationViewController as! SecondViewController;
            svc.toPass = spfText.text
        }
    }
    
    
    
        // tap anywhere to exit num keypad
    func didTapView() {
        self.view.endEditing(true)
    }
        // tap 'done' to dismiss keypad
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
        // swipe down to dismiss keypad
    func dismissKeyboard() {
        self.spfText.resignFirstResponder()
    }
    
        // Current Location delegate methods
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        CLGeocoder().reverseGeocodeLocation(manager.location, completionHandler: { (placemarks, error) -> Void in
            if error != nil {
                println("Error: " + error.localizedDescription)
                return
            }
            if placemarks.count > 0 {
                let pm = placemarks[0] as! CLPlacemark
                self.displayLocationInfo(pm)
            } else {
                println("Error with the data")
            }
        })
    }
    
    func displayLocationInfo(placemark: CLPlacemark) {
        self.locationManager.stopUpdatingLocation()
        println(placemark.locality)
        println(placemark.postalCode)
        println(placemark.administrativeArea)
        println(placemark.country)
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("Error: " + error.localizedDescription)
    }

}

