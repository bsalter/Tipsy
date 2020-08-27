//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var currentTipAmount: Float = 0.1
    var numberOfSplits: Float = 2
    var perPersonTotal: Float = 0
    var paymentBrain = PaymentBrain()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        let tipButtons = [zeroPctButton, tenPctButton, twentyPctButton]
        tipButtons.forEach { button in
            button!.isSelected = false
        }
        sender.isSelected = true
        switch sender.titleLabel!.text {
        case "0%":
            currentTipAmount = 0.0
        case "10%":
            currentTipAmount = 0.1
        default:
            currentTipAmount = 0.2
        }
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let currentValue = Int(sender.value).description
        splitNumberLabel.text = currentValue
        numberOfSplits = Float(currentValue)!
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let currentBill = Float(billTextField.text!) ?? 123.56
        paymentBrain.calculatePayment(total: currentBill, split: numberOfSplits, tip: currentTipAmount)
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.perPersonTotal = paymentBrain.getPersonTotal()
            destinationVC.setting = paymentBrain.getSettings()
        }
    }
    

}

