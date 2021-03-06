//
//  TipCalculator.swift
//  TipCalculator
//
//  Created by Keaton Swoboda on 4/1/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

import Foundation

class TipCalculatorModel
{
    var total: Double
    var taxPercent: Double
    var subTotal: Double
        {
            return total / (taxPercent + 1)
    }
    
    init(total: Double, taxPercent: Double)
    {
        self.total = total
        self.taxPercent = taxPercent
        
    }
    func calcTipWithTipPercent(tipPercent:Double) ->(tipAmount:Double, total:Double)
    {
        let tipAmount = subTotal * tipPercent
        let finalTotal = total + tipAmount
        return (tipAmount, finalTotal)
    }
    
    
    func printPossibleTips()
    {
        println("15% \(calcTipWithTipPercent(0.15))")
        println("18% \(calcTipWithTipPercent(0.18))")
        println("20% \(calcTipWithTipPercent(0.20))")
    }
    
    func returnPossibleTips() -> [Int: (tipAmount:Double, total:Double)]
    {
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        var rValue = Dictionary<Int,(tipAmount:Double, total:Double)>()
        for possibleTips in possibleTipsInferred
        {
            let integerPercent = Int(possibleTips*100)
            rValue[integerPercent] = calcTipWithTipPercent(possibleTips)
        }
        return rValue
    }
}
