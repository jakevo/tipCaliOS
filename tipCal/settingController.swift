//
//  settingController.swift
//  tipCal
//
//  Created by Jake Vo on 12/12/16.
//  Copyright © 2016 Jake Vo. All rights reserved.
//

import UIKit


protocol DataEnteredDelegate {
    
    func userDidEnterInfo (poor:String, fair:String, good:String, better:String)
}
class settingController: UIViewController {

    @IBOutlet weak var poorField: UITextField!
    @IBOutlet weak var fairField: UITextField!
    @IBOutlet weak var goodField: UITextField!
    @IBOutlet weak var betterField: UITextField!
  
    @IBOutlet weak var updateBut: UIButton!
    
    var delegate:DataEnteredDelegate? = nil
    
    
    @IBAction func updateTip(_ sender: Any) {
        
        if (delegate != nil) {
            
            if (poorField.text?.isEmpty)! {
                poorField.text = "5"
            }
            
            if (fairField.text?.isEmpty)! {
                fairField.text = "1"
            }
            if (goodField.text?.isEmpty)! {
                goodField.text = "15"
            }
            if (betterField.text?.isEmpty)! {
                betterField.text = "2"
            }
            
            let poorF: String = poorField.text!
            let fairF: String = fairField.text!
            let goodF: String = goodField.text!
            let betterF: String = betterField.text!
            
            delegate!.userDidEnterInfo(poor: poorF, fair:fairF, good:goodF,
                                       better:betterF)
            
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
