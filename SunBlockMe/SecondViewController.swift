//
//  SecondViewController.swift
//  SunBlockMe
//
//  Created by Angel Baek on 5/26/15.
//  Copyright (c) 2015 Angel Baek. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    // MARK: Outlets and properties
    @IBOutlet weak var displayCountDownTimeLabel: UILabel!
    var startTime = NSTimeInterval()
    var timer = NSTimer()
    var secondsLeft: Int = 0
    var hours: Int = 0
    var minutes: Int = 0
    var seconds: Int = 0
    var toPass: String!
//    var spfPassedData: Int!
    
    // MARK: Actions
    @IBAction func start(sender: AnyObject) {
        if !timer.valid {
            let updateTime: Selector = "updateTime"
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: updateTime, userInfo: nil, repeats: true)
            startTime = NSDate.timeIntervalSinceReferenceDate()
        }
    }
    @IBAction func stop(sender: AnyObject) {
        timer.invalidate()
    }
    
    @IBAction func back(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {});
    }
    
    
    // MARK: Instance methods
    func updateTime() {
        if (secondsLeft > 0) {
            secondsLeft--
            hours = secondsLeft / 3600
            minutes = (secondsLeft % 3600) / 60
            seconds = (secondsLeft % 3600) % 60
            displayCountDownTimeLabel.text = String(format: "%02d:%02d:%02d", arguments: [hours, minutes, seconds])
        } else {
            // ADD ALERT? LOCAL NOTIFICATION? when timer is finished
            timer.invalidate()
            displayCountDownTimeLabel.text = "00:02:00" // Set this to variable -- able to be set at view load
            secondsLeft = 120 // TEST: 2 min
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ADD: PASS IN START TIME PARAMS HERE TO SECONDSLEFT
        println("\(toPass)")
        
        secondsLeft = 120; // TEST: 2 minutes
        displayCountDownTimeLabel.text = "00:02:00"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

