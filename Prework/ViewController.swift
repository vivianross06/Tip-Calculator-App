//
//  ViewController.swift
//  Prework
//
//  Created by Vivian Ross on 1/31/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    var defaultSet = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
    }

    @IBAction func calculateTip(_ sender: UISegmentedControl) {
        defaultSet = false
        //get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //get total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //update tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        //update total amount
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func calculateTipFromBillAmount(_ sender: Any) {
        //get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //get total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15, 0.18, 0.2]
        if (defaultSet == false){
            let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
            let total = bill + tip
            //update tip amount label
            tipAmountLabel.text = String(format: "$%.2f", tip)
            //update total amount
            totalLabel.text = String(format: "$%.2f", total)
        }else if (defaultSet == true){
            let defaults = UserDefaults.standard
            let defaultTipSelection = defaults.integer(forKey: "defaultTip")
            let tip = bill * tipPercentages[defaultTipSelection]
            let total = bill + tip
            //update tip amount label
            tipAmountLabel.text = String(format: "$%.2f", tip)
            //update total amount
            totalLabel.text = String(format: "$%.2f", total)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let defaultTipSelection = defaults.integer(forKey: "defaultTip")
        defaultSet = true
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[defaultTipSelection]
        let total = bill + tip
        //update tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        //update total amount
        totalLabel.text = String(format: "$%.2f", total)
    }
    
}

