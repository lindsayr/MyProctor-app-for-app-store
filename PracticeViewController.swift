//
//  PracticeViewController.swift
//  SimpleStopDemo
//
//  Created by Lindsay Rosston on 22/07/14.
//  Copyright (c) 2015 Lindsay Rosston. All rights reserved.
//

import UIKit

class PracticeViewController: UIViewController {
    
    @IBOutlet weak var currentSection: UILabel!
    //var currentSectionNo = currentSection.text
    let sectionLabels = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    var currentSectionNumber = 1

    @IBOutlet weak var sectionTimeGiven: UILabel!
    let sectionTimes = ["25", "25", "25", "25", "25", "25", "20", "20", "10", ""]
    var currentSectionTime = 1
    
    @IBOutlet var displayTimeLabel: UILabel!
    
    @IBOutlet weak var skipSection: UIButton!
    
    @IBAction func sectionSkip(sender: AnyObject) {
        currentSectionNumber += 1
        currentSection.text = sectionLabels[currentSectionNumber - 1]
        currentSectionTime += 1
        sectionTimeGiven.text = sectionTimes[currentSectionTime - 1]
        timer.invalidate()
        displayTimeLabel.text = "00:00"
        if currentSectionNumber == 10 {
            currentSectionNumber = 1
            currentSection.text = sectionLabels[currentSectionNumber - 1]
            currentSectionTime = 1
            sectionTimeGiven.text = sectionTimes[currentSectionTime - 1]
            
            var alert = UIAlertController(title: "End of SAT", message: "Silly you! You're on the last section, and there is not another section after  9!", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Okay, start a new test", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            //somehow make the section go back to zero
        }
    }
    
    var startTime = NSTimeInterval()
    
    var timer:NSTimer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func start(sender: AnyObject) {
        if (!timer.valid) {
            let aSelector : Selector = "updateTime"
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: aSelector, userInfo: nil, repeats: true)
            startTime = NSDate.timeIntervalSinceReferenceDate()
        }
    }
    
    @IBAction func stop(sender: AnyObject) {
        timer.invalidate()
    }
    
    @IBAction func reset(sender: AnyObject) {
        timer.invalidate()
        var minutes = 0
        var seconds = 0
        displayTimeLabel.text = "00:00"
    }
    
    func updateTime() {
        var currentTime = NSDate.timeIntervalSinceReferenceDate()
        
        //Find the difference between current time and start time.
        var elapsedTime: NSTimeInterval = currentTime - startTime
        
        //calculate the minutes in elapsed time.
        let minutes = UInt8(elapsedTime / 60.0)
        elapsedTime -= (NSTimeInterval(minutes) * 60)
        
        //calculate the seconds in elapsed time.
        let seconds = UInt8(elapsedTime)
        elapsedTime -= NSTimeInterval(seconds)
        
        //find out the fraction of milliseconds to be displayed.
        let fraction = UInt8(elapsedTime * 100)
        
        //add the leading zero for minutes, seconds and millseconds and store them as string constants
        let strMinutes = minutes > 9 ? String(minutes):"0" + String(minutes)
        let strSeconds = seconds > 9 ? String(seconds):"0" + String(seconds)
        let strFraction = fraction > 9 ? String(fraction):"0" + String(fraction)
        
        //concatenate minuets, seconds and milliseconds as assign it to the UILabel
        displayTimeLabel.text = "\(strMinutes):\(strSeconds)"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
