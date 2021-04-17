//
//  ViewController.swift
//  Tipsy
//


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billTotalLabel: UITextField!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    
    var currentTipPercentage: UIButton?
    var tipPercentage: Int?
    var calculatorBrain = CalculatorBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        currentTipPercentage = tenButton
        tipPercentage = 10
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        let billTotal = billTotalLabel.text ?? "0"
        calculatorBrain.calculateTip(billTotal, tipPercentage!, splitLabel.text!)
        self.performSegue(withIdentifier: "toResultViewController", sender: self)
    }
    
    @IBAction func splitStepperPressed(_ sender: UIStepper) {
        let roundedSplitValue = Int(sender.value)
        splitLabel.text = String(roundedSplitValue)
    }
    
    @IBAction func tipButtonPressed(_ sender: UIButton) {
        currentTipPercentage?.isSelected = false
        currentTipPercentage = sender
        sender.isSelected = true
        if let senderTitle = sender.titleLabel?.text {
            if(senderTitle == "0%") {
                self.tipPercentage = 0
            }
            else if(senderTitle == "10%") {
                self.tipPercentage = 10
            }
            else if (senderTitle == "20%") {
                self.tipPercentage = 20
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toResultViewController") {
            let destination = segue.destination as! ResultViewController
            print(calculatorBrain.getSplitAmount())
            destination.totalPerPerson = calculatorBrain.getSplitAmount()
            destination.messageLabelVariable = calculatorBrain.getResultScreenText()
        }
    }
    
}

