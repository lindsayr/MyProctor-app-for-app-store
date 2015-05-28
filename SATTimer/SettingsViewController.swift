//
//  SettingsViewController.swift
//  SATTimer
//
//  Created by Lindsay Rosston on 5/6/15.
//  Copyright (c) 2015 CompSci. All rights reserved.
//
/*
import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var extra50: UISwitch!
    @IBAction func saveSwitch1State(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        
        if extra50.on {
            defaults.setBool(true, forKey: "saveSwitch1State")
        } else {
            defaults.setBool(false, forKey: "saveSwitch1State")
        }
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
        if (defaults.objectForKey("saveSwitch1State") != nil) {
            extra50.on = defaults.boolForKey("saveSwitch1State")
        }
    }
}
*/