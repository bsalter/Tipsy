//
//  PaymentBrain.swift
//  Tipsy
//
//  Created by Salter, Benn on 4/25/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct PaymentBrain {
    var payment: Payment?
    
    mutating func calculatePayment(total: Float, split: Float, tip: Float) {
        let paymentTotal = (total + (total * tip)) / split
        let splitText = String(format: "%.0f", split)
        let tipText = String(format: "%.0f", tip * 100)
        let setting = "Split between \(splitText) people, with \(tipText)% tip."
        payment = Payment(total: paymentTotal, setting: setting)
    }
    
    func getPersonTotal() -> String {
        return String(format: "%.2f", payment?.total ?? "")
    }
    
    func getSettings() -> String {
        return payment?.setting ?? ""
    }
}
