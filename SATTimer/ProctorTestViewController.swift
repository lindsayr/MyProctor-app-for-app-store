//
//  ProctorTestViewController.swift
//  SATTimer
//
//  Created by Lindsay Rosston on 5/15/15.
//  Copyright (c) 2015 CompSci. All rights reserved.
//

import UIKit

class ProctorTestViewController: UIViewController {
    
    var proctorSectionTimes: [Int]! // TimerViewController will set in prepareForSegue
    var sectionNumber: Int! // TimerViewController will set in prepareForSegue
    var remainingTime = 0 // in seconds
    var timer: NSTimer?
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet var moveToScoringLabel: UILabel!

    @IBOutlet weak var enterScoreNOW: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareToBeginSection()
    }
    
    func prepareToBeginSection() {
        // Calculate the starting seconds, for the timer to count down
        remainingTime = proctorSectionTimes[sectionNumber-1] * 60 // Subtract 1 for 0-indexing
        
        // Set the timer label to the starting minutes
        timerLabel.text = "\(proctorSectionTimes[sectionNumber-1]) : 00" // Subtract 1 for 0-indexing
        
        // Set the section label text
        if (sectionNumber == 4 || sectionNumber == 8){
            sectionLabel.text = "Break!"
        } else if (sectionNumber == 1 || sectionNumber == 2 || sectionNumber == 3){
            sectionLabel.text = "Section \(sectionNumber)"
        } else if (sectionNumber == 5 || sectionNumber == 6 || sectionNumber == 7){
            sectionLabel.text = "Section \(sectionNumber-1)"
        } else { // Sections 9, 10, and 11 subtract 2
            sectionLabel.text = "Section \(sectionNumber-2)"
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func moveToScore(){
        moveToScoringLabel.text = "Save My Scores"
        timerLabel.text = "DONE!"
    }
    
    @IBAction func buttonPressed()  {
        // Greyson: begin timer when Start button pressed
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true)
        NSLog("Button Pressed")
        
    }
    
    func subtractTime() {
        remainingTime--
        let seconds = remainingTime % 60
        let minutes = remainingTime / 60
        timerLabel.text = "\(minutes) : \(seconds)"
        if(minutes == 0 && sectionNumber != 11 && seconds == 0) {
            timer!.invalidate()
            let alert = UIAlertController(title: "Time is up!", message: "Take a quick breath and tap to begin the next section.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Start next section", style: UIAlertActionStyle.Default, handler: {
                (action) in self.prepareToBeginSection()}))
            presentViewController(alert, animated: true, completion:nil)
            sectionNumber = sectionNumber + 1
        }
        else if(minutes == 0 && sectionNumber == 11 && seconds == 0){
            timer!.invalidate()
            let alertController = UIAlertController(title: "DONE! ", message: "Please input your score:", preferredStyle: .Alert)
            
            let confirmAction = UIAlertAction(title: "Submit Score", style: .Default, handler: {(action) in
                let mathScore =
                (alertController.textFields?[0] as! UITextField).text
                let readingScore =
                (alertController.textFields?[1] as! UITextField).text
                let writingScore = (alertController.textFields?[2] as! UITextField).text
                
            })//make it so after pressing submit score it takes you to the score page!!!
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (_) in }
            
            alertController.addTextFieldWithConfigurationHandler { (textField) in
                textField.placeholder = "MATH SCORE"
            }
            
            alertController.addTextFieldWithConfigurationHandler { (textField) in
                textField.placeholder = "WRITING SCORE"
            }
            
            alertController.addTextFieldWithConfigurationHandler { (textField) in
                textField.placeholder = "CRITICAL READING SCORE"
            }
            
            alertController.addAction(confirmAction)
            alertController.addAction(cancelAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
            enterScoreNOW.text = "Enter your score!"

            }
        }
        
}


