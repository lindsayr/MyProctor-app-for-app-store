//
//  SecondViewController.swift
//  SATTimer
//
//  Created by Lindsay Rosston on 4/3/15.
//  Copyright (c) 2015 CompSci. All rights reserved.
//

import UIKit



class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    @IBOutlet weak var loadDataButton: UIButton! // needed?
    
    
    @IBOutlet weak var featuredMathLabel: UILabel!
    @IBOutlet weak var featuredWritingLabel: UILabel!
    @IBOutlet weak var featuredCRLabel: UILabel!
    @IBOutlet weak var featuredDateLabel: UILabel!
    
    
    @IBOutlet weak var oneMathLabel: UILabel!
    @IBOutlet weak var oneWritingLabel: UILabel!
    @IBOutlet weak var oneCRLabel: UILabel!
    @IBOutlet weak var oneDateLabel: UILabel!
    
    
    
    @IBOutlet weak var twoMathLabel: UILabel!
    @IBOutlet weak var twoWritingLabel: UILabel!
    @IBOutlet weak var twoCRLabel: UILabel!
    @IBOutlet weak var twoDateLabel: UILabel!
    
    let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //@IBAction func loadDataPushed(sender: AnyObject) {
    //loadData()
    //}
    
    
    func loadData() {
        if let testCompositeArray:NSMutableArray = defaults.objectForKey("testScoreSATArray") as? NSMutableArray {
            
            
            let testArray = defaults.objectForKey("testScoreSATArray") as! NSMutableArray
            
            let featuredScoreMath: AnyObject! = testArray[0][0]
            featuredMathLabel.text = toString(featuredScoreMath)
            
            let featuredScoreWriting: AnyObject! = testArray[0][1]
            featuredWritingLabel.text = toString(featuredScoreWriting)
            
            let featuredScoreCR: AnyObject! =
            testArray [0][2]
            featuredCRLabel.text = toString(featuredScoreCR)
            
            let featuredScoreDate: AnyObject! =
            testArray [0][3]
            featuredDateLabel.text = toString(featuredScoreDate)//now DATE loads CR score - also implement date for one and two
            
            let oneScoreMath: AnyObject! = testArray[1][0]
            oneMathLabel.text = toString(oneScoreMath)
            
            let oneScoreWriting: AnyObject! = testArray[1][1]
            oneWritingLabel.text = toString(oneScoreWriting)
            
            let oneScoreCR: AnyObject! = testArray [1][2]
            oneCRLabel.text = toString(oneScoreCR)
            let oneScoreDate: AnyObject! = testArray [1][3]
            oneDateLabel.text = toString(oneScoreDate)
            
            let twoScoreMath: AnyObject! = testArray[2][0]
            twoMathLabel.text = toString(twoScoreMath)
            
            let twoScoreWriting: AnyObject! = testArray[2][1]
            twoWritingLabel.text = toString(twoScoreWriting)
            
            let twoScoreCR: AnyObject! = testArray [2][2]
            twoCRLabel.text = toString(twoScoreCR)
            let twoScoreDate: AnyObject! = testArray [2][3]
            twoDateLabel.text = toString(twoScoreDate)
            
            
        }
    }
}


