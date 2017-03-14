//
//  SettingsViewController.swift
//  TipCal
//
//  Created by Akanksha Saxena on 3/7/17.
//  Copyright © 2017 Akanksha Saxena. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.alpha = 0
        UIView.animate(withDuration: 0.4, animations: {
            self.view.alpha = 1
        })
        let defSetting = UserDefaults.standard
        let defPercent = defSetting.integer(forKey: "default_percent")
        self.defaultTipControl.selectedSegmentIndex = defPercent
    }
    
    @IBAction func configureDefaultTip(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        //let percentTip = [0.18, 0.2, 0.25]
        //print(defaultTipControl.selectedSegmentIndex)
        
        defaults.set(defaultTipControl.selectedSegmentIndex, forKey: "default_percent")
        
        defaults.synchronize()
        let per = defaults.integer(forKey: "default_percent")
        print(per)
        
        
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
