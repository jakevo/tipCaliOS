//
//  ViewController.swift
//  tipCal
//
//  Created by Jake Vo on 12/12/16.
//  Copyright © 2016 Jake Vo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DataEnteredDelegate {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipPercentages: UISegmentedControl!
    @IBOutlet weak var oneBill: UILabel!
    
    @IBOutlet weak var twoBill: UILabel!
    @IBOutlet weak var threeBill: UILabel!
    @IBOutlet weak var fourBill: UILabel!
    @IBOutlet weak var fiveBill: UILabel!
    
    var poorPercent:Double = 5
    var fairPercent:Double = 10
    var goodPercent:Double = 15
    var betterPercent:Double = 25
    
    @IBOutlet weak var tip1: UILabel!
    @IBOutlet weak var tip2: UILabel!
    @IBOutlet weak var tip3: UILabel!
    @IBOutlet weak var tip4: UILabel!
    @IBOutlet weak var tip5: UILabel!
    
    
    override func viewDidLoad() {
        billField.becomeFirstResponder()
        super.viewDidLoad()
        //billField.becomeFirstResponder()
    }

    func userDidEnterInfo(poor: String, fair: String, good: String, better: String) {
        poorPercent = Double (poor)!
        fairPercent = Double (fair)!
        goodPercent = Double (good)!
        betterPercent = Double (better)!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "showSetting" {
            let settingCont:settingController = segue.destination as! settingController
            settingCont.delegate = self
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    
    @IBAction func tipCalculate(_ sender: AnyObject) {
    
        
        let tipPercent = [poorPercent/100, fairPercent/100, goodPercent/100,
                          betterPercent/100]
        
        
        let bill = Double (billField.text!) ?? 0
        
        let tip = bill * tipPercent[tipPercentages.selectedSegmentIndex]
        
        let billForOne = tip + bill
        
        
        //let total = bill * tipPercent[tipPercentages.selectedSegmentIndex]
        
        oneBill.text   = String (format: "$%.2f", billForOne)
        twoBill.text   = String (format: "$%.2f", billForOne/2)
        threeBill.text = String (format: "$%.2f", billForOne/3)
        fourBill.text  = String (format: "$%.2f", billForOne/4)
        fiveBill.text  = String (format: "$%.2f", billForOne/5)
        
        tip1.text = String (format: "$%.2f", tip)
        tip2.text = String (format: "$%.2f", tip/2)
        tip3.text = String (format: "$%.2f", tip/3)
        tip4.text = String (format: "$%.2f", tip/4)
        tip5.text = String (format: "$%.2f", tip/5)
        
        
        
        
    }
    
    
    
}

