//
//  ViewController.swift
//  tips
//
//  Created by Melanie L. Mendoza on 12/30/15.
//  Copyright © 2015 Melanie L. Mendoza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    var tipPercantage = 0.18
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.becomeFirstResponder()
        
        let userLocale = NSLocale.currentLocale()
        let currencySymbol = userLocale.objectForKey(NSLocaleCurrencySymbol) as! String
        print(currencySymbol)
        tipLabel.text = currencySymbol + "0.00"
        totalLabel.text = currencySymbol + "0.00"

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.18,0.2,0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        
        let billAmount = NSString(string: (billField.text)!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = .CurrencyStyle
        
        let tipText = numberFormatter.stringFromNumber(NSNumber(double: tip))
        
        let totalText = numberFormatter.stringFromNumber(NSNumber(double: total))
        
        tipLabel.text = tipText
        totalLabel.text = totalText
        
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
}

