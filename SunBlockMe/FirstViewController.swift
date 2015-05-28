//
//  FirstViewController.swift
//  SunBlockMe
//
//  Created by Angel Baek on 5/26/15.
//  Copyright (c) 2015 Angel Baek. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var spfLabel: UILabel!
    @IBOutlet var spfText: UITextField!
    @IBOutlet weak var activityLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let fontFamilyNames = UIFont.familyNames()
//        for familyName in fontFamilyNames {
//            println("Font Family Name = [\(familyName)]")
//            let names = UIFont.fontNamesForFamilyName(familyName as! String)
//            println("Font Names = [\(names)]")
//        }
        
        spfLabel.text = "SPF"
        spfLabel.font = UIFont(name: "sunday", size: 60.0)
        spfText.font = UIFont(name: "SUNN", size: 55.0)
        activityLabel.font =  UIFont(name: "SUNN", size: 90.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

