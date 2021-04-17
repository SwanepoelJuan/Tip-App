//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Juan Swanepoel on 2021/04/17.

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalPerPersonLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    var totalPerPerson: String?
    var messageLabelVariable: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.totalPerPersonLabel.text = totalPerPerson
        self.messageLabel.text = messageLabelVariable
    }
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
