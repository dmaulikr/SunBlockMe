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
    let spfPassedData: Int? = 0
    
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
            if let startValue = self.toPass.toInt() {
            displayTime(startValue) // Set this to variable -- able to be set at view load
//            secondsLeft = 180 // TEST: 2 min
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("\(toPass)")
        let spfValue:Int? = toPass.toInt()
        displayTime(spfValue!)
    }
    
    func displayTime(value:Int) {
        switch value {
        case (55...100):
            secondsLeft = 3600
            displayCountDownTimeLabel.text = "00:60:00"
        case (45...55):
            secondsLeft = 2700
            displayCountDownTimeLabel.text = "00:45:00"
        case (30...45):
            secondsLeft = 1800
            displayCountDownTimeLabel.text = "00:30:00"
        case (15...30):
            secondsLeft = 1200
            displayCountDownTimeLabel.text = "00:20:00"
        case (0...15):
            secondsLeft = 900
            displayCountDownTimeLabel.text = "00:15:00"
        default:
            secondsLeft = 900
            displayCountDownTimeLabel.text = "00:15:00"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

