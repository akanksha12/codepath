//
//  ViewController.swift
//  TipCal
//
//  Created by Akanksha Saxena on 3/5/17.
//  Copyright © 2017 Akanksha Saxena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billText: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var currencyTotalLabel: UILabel!
    @IBOutlet weak var currrencyTipLabel: UILabel!
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.navigationBar.barTintColor = UIColor.lightGray;
        
        let def = UserDefaults.standard
        let saved_bill = def.integer(forKey: "saved_bill")
        var billStr = ""

        if saved_bill != 0 {
            
            billStr = String(saved_bill)
        }
        billText.text = billStr

    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.alpha = 0
        UIView.animate(withDuration: 0.4, animations: {
            self.view.alpha = 1
        })
        
        billText.becomeFirstResponder();
        
        let defSetting = UserDefaults.standard
        let defPercent = defSetting.integer(forKey: "default_percent")
        self.tipControl.selectedSegmentIndex = defPercent
        calculateTip(self)
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIView.animate(withDuration: 0.4, animations: {
            self.view.alpha = 0
        })
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipPercent = [0.18, 0.20, 0.25]
        let bill = Double(billText.text!) ?? 0
        
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currency
        
        let saveBill = UserDefaults.standard
        saveBill.set(bill, forKey: "saved_bill")
        saveBill.synchronize()
        
        let tip = bill * tipPercent[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = formatter.string(from: NSNumber(value: tip))
    
        totalLabel.text = formatter.string(from: NSNumber(value: total))

    }
    
    

}

