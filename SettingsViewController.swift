//
//  SettingsViewController.swift
//  Prework
//
//  Created by Vivian Ross on 2/24/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var DefaultTipSelection: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func SelectDefaultTip(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(DefaultTipSelection.selectedSegmentIndex, forKey: "defaultTip")
        defaults.synchronize()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
