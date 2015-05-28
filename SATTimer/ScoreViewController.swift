//
//  ScoreViewController.swift
//  SATTimer
//
//  Created by Lindsay Rosston on 4/17/15.
//  Copyright (c) 2015 CompSci. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
    
    let scoreKey = "SATscoreKey"
    
    let prefs = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var mathScore: UITextField!
    @IBOutlet weak var writingScore: UITextField!
    @IBOutlet weak var CRScore: UITextField!
    @IBOutlet weak var dateTaken: UITextField!
    @IBOutlet weak var displayDataLabel: UILabel!
    
    
    
    @IBOutlet weak var saveScores: UIButton!
    
    @IBOutlet weak var loadDataButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    @IBAction func saveDataClicked(sender: AnyObject) {
        if let testCompositeArray:NSMutableArray = defaults.objectForKey("testScoreSATArray") as? NSMutableArray {
            
            let oldArray = defaults.objectForKey("testScoreSATArray") as! NSMutableArray
            
            oldArray.insertObject([self.mathScore.text, self.writingScore.text, self.CRScore.text, dateTaken.text], atIndex: 0)
            
            defaults.setObject(oldArray, forKey: "testScoreSATArray")
            
            
        }
        else {
            defaults.setObject([[self.mathScore.text, self.writingScore.text, self.CRScore.text, self.dateTaken.text]], forKey: "testScoreSATArray")
        }
        
        
    }
    
    //if let nsArray:NSArray = levelArray as? NSArray{
    
    @IBAction func loadData(sender: AnyObject) {
        if let testCompositeArray:NSMutableArray = defaults.objectForKey("testScoreSATArray") as? NSMutableArray {
            
            //self.showDataLabel.text = defaults.objectForKey("testScoreSATArray") as NSArray
            
            let testArray = defaults.objectForKey("testScoreSATArray") as! NSMutableArray
            
            let testScoreOne = testArray[0][1]
            
            self.displayDataLabel.text = toString(testScoreOne)
            
            
        }
    }
}



/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
// Get the new view controller using segue.destinationViewController.
// Pass the selected object to the new view controller.
}
*/

