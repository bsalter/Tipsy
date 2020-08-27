//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Salter, Benn on 4/25/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    var perPersonTotal: String = ""
    var setting: String = ""
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = "$" + String(perPersonTotal)
        settingsLabel.text = setting
    }
}
