//
//  SecondViewController.swift
//  SunBlockMe
//
//  Created by Angel Baek on 5/26/15.
//  Copyright (c) 2015 Angel Baek. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var countdownLabel: UILabel!
    
    var count = 10
    override func viewDidLoad() {
        super.viewDidLoad()
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: Selector("countdown"), userInfo: nil, repeats: true)
    }
    
    func countdown() {
        
        if(count > 0)
        {
            countdownLabel.text = String(count--)
        }    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

