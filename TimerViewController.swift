//
//  TimerViewController.swift
//  SATTimer
//
//  Created by Lea Sparkman on 4/14/15.
//  Copyright (c) 2015 CompSci. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    var proctorSectionTimes = [25, 25, 25, 5, 25, 25, 25, 5, 20, 20, 10]
    var proctorSectionTimesExtended = [38, 38, 38, 5, 38, 38, 38, 5, 30, 30, 15]
    var sectionNumber = 1
    var extendedTime: Bool = false
    
    @IBOutlet weak var switchBtnObj: UISwitch!
    @IBOutlet weak var extraTimeLabel: UILabel!
    
    //line-up labels below
    @IBOutlet var section1Label: UILabel!
    @IBOutlet var section2Label: UILabel!
    @IBOutlet var section3Label: UILabel!
    @IBOutlet var section4Label: UILabel!
    @IBOutlet var section5Label: UILabel!
    @IBOutlet var section6Label: UILabel!
    @IBOutlet var section7Label: UILabel!
    @IBOutlet var section8Label: UILabel!
    @IBOutlet var section9Label: UILabel!
    
    
    @IBAction func switchBtnClicked(sender: AnyObject) {
        // Greyson: This is called after switch gets toggled. Synch its state with extendedTime variable.
        if let extendedTimeSwitch = sender as? UISwitch {
            let state = extendedTimeSwitch.on
            if state == true {
                extendedTime = true
                extraTimeLabel.text = "Extra time is ON"
                section1Label.text = "Section 1: 38 minutes"
                section2Label.text = "Section 2: 38 minutes"
                section3Label.text = "Section 3: 38 minutes"
                section4Label.text = "Section 4: 38 minutes"
                section5Label.text = "Section 5: 38 minutes"
                section6Label.text = "Section 6: 38 minutes"
                section7Label.text = "Section 7: 30 minutes"
                section8Label.text = "Section 8: 30 minutes"
                section9Label.text = "Section 9: 15 minutes"
            }
            else {
                extendedTime = false
                extraTimeLabel.text = "Extra time is OFF"
                section1Label.text = "Section 1: 25 minutes"
                section2Label.text = "Section 2: 25 minutes"
                section3Label.text = "Section 3: 25 minutes"
                section4Label.text = "Section 4: 25 minutes"
                section5Label.text = "Section 5: 25 minutes"
                section6Label.text = "Section 6: 25 minutes"
                section7Label.text = "Section 7: 20 minutes"
                section8Label.text = "Section 8: 20 minutes"
                section9Label.text = "Section 9: 10 minutes"            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Greyson: synch the switch state with extendedTime when view appears
        if extendedTime == true {
            switchBtnObj.on = true
            extraTimeLabel.text = "Extra time is ON"
            section1Label.text = "ON"
            section1Label.text = "Section 1: 38 minutes"
            section2Label.text = "Section 2: 38 minutes"
            section3Label.text = "Section 3: 38 minutes"
            section4Label.text = "Section 4: 38 minutes"
            section5Label.text = "Section 5: 38 minutes"
            section6Label.text = "Section 6: 38 minutes"
            section7Label.text = "Section 7: 30 minutes"
            section8Label.text = "Section 8: 30 minutes"
            section9Label.text = "Section 9: 15 minutes"
        }
        else {
            switchBtnObj.on = false
            extraTimeLabel.text = "Extra time is OFF"
            section1Label.text = "OFF"
            extendedTime = false
            extraTimeLabel.text = "Extra time is OFF"
            section1Label.text = "Section 1: 25 minutes"
            section2Label.text = "Section 2: 25 minutes"
            section3Label.text = "Section 3: 25 minutes"
            section4Label.text = "Section 4: 25 minutes"
            section5Label.text = "Section 5: 25 minutes"
            section6Label.text = "Section 6: 25 minutes"
            section7Label.text = "Section 7: 20 minutes"
            section8Label.text = "Section 8: 20 minutes"
            section9Label.text = "Section 9: 10 minutes"
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let proctorTestViewController = segue.destinationViewController as! ProctorTestViewController
        proctorTestViewController.sectionNumber = sectionNumber
        if extendedTime == true {
            proctorTestViewController.proctorSectionTimes = proctorSectionTimesExtended
        } else {
            proctorTestViewController.proctorSectionTimes = proctorSectionTimes
        }
    }
}