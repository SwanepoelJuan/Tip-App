//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Juan Swanepoel on 2021/04/17.


import UIKit

struct CalculatorBrain {
    
    var tip: Tip?
    
    mutating func calculateTip(_ billAmount: String, _ tipPercentage: Int, _ split: String) {
        
        let billAmountD = Double(billAmount) ?? 0.0
        let tipAmount = billAmountD * (Double(tipPercentage)/100)
        
        let billTotal = billAmountD + tipAmount
        
        let splitInteger = Int(split) ?? 1
        let splitAmount = calculateSplitAmount(billTotal, splitInteger)
        
        tip = Tip(tipAmount: tipAmount, totalAmount: billTotal, tipAmountPerPerson: splitAmount, split: split, percentage: tipPercentage)
    }
    
    func calculateSplitAmount(_ billTotal: Double, _ split: Int) -> Double {
        let splitAmount = billTotal/Double(split)
        return splitAmount
    }

    func getSplitAmount() -> String {
        let splitAmount = String(tip?.tipAmountPerPerson ?? 0)
        return splitAmount
    }
    
    func getResultScreenText() -> String {
        let amountOfPeople = String(tip?.split ?? "1")
        let tipPercentage = String(tip?.percentage ?? 0)
        let screenText = "Split between \(amountOfPeople), with a \(tipPercentage)% tip."
        return screenText
    }
}
