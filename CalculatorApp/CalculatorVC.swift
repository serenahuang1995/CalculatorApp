//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Ｍason Chang on 2020/9/20.
//  Copyright © 2020 serena. All rights reserved.
//

import UIKit

enum OperationType{
    case plus
    case minus
    case multiply
    case divide
    case change
    case percent
    case none
}

class CalculatorVC: UIViewController {
    var behindNumber: Double = 0
    var previousNumber: Double = 0
    var operation = OperationType.none
    var starNew = true
    
    
    @IBOutlet weak var showTheAnswerLabel: UILabel!
    @IBOutlet weak var answerBtn: UIButton!
    

    @IBAction func plus(_ sender: UIButton) {
        showTheAnswerLabel.text = "+"
        operation = .plus
        previousNumber = behindNumber
    }
    
    @IBAction func minus(_ sender: UIButton) {
        showTheAnswerLabel.text = "-"
        operation = OperationType.minus
        previousNumber = behindNumber
    }
    
    @IBAction func multiply(_ sender: UIButton) {
        showTheAnswerLabel.text = "x"
        operation = .multiply
        previousNumber = behindNumber
    }
    
    @IBAction func divide(_ sender: UIButton) {
        showTheAnswerLabel.text = "/"
        operation = .divide
        previousNumber = behindNumber
    }
    
    @IBAction func change(_ sender: UIButton) {
        showTheAnswerLabel.text = "+/-"
        operation = .change
        previousNumber = behindNumber
    }
    
    @IBAction func percent(_ sender: UIButton) {
        showTheAnswerLabel.text = "%"
        operation = .percent
        previousNumber = behindNumber
    }
    
    @IBAction func answer(_ sender: UIButton) {
        switch operation{
        case .plus : showTheAnswerLabel.text = "\(previousNumber + behindNumber)"
        case .minus : showTheAnswerLabel.text = "\(previousNumber - behindNumber)"
        case .multiply : showTheAnswerLabel.text = "\(previousNumber * behindNumber)"
        case .divide : showTheAnswerLabel.text = "\(previousNumber / behindNumber)"
        case .percent : showTheAnswerLabel.text = "\(previousNumber / 100)"
        case .change:
            behindNumber = -previousNumber
            showTheAnswerLabel.text = "\(behindNumber)"
        case .none : showTheAnswerLabel.text = "0"
        }
        starNew = true
    }
    
    @IBAction func resetToZero(_ sender: Any) {
        showTheAnswerLabel.text="0"
        behindNumber = 0
        previousNumber = 0
        operation = .none
        starNew = true
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        let buttonNumber = sender.tag
        if starNew == true {
            showTheAnswerLabel.text = "\(buttonNumber)"
            starNew = false
        }else{
            if showTheAnswerLabel.text == "0" || showTheAnswerLabel.text == "+" || showTheAnswerLabel.text == "-" || showTheAnswerLabel.text == "x" || showTheAnswerLabel.text == "/" || showTheAnswerLabel.text == "+/-" || showTheAnswerLabel.text == "%" {
                showTheAnswerLabel.text = "\(buttonNumber)"
                
            }else{
                showTheAnswerLabel.text = showTheAnswerLabel.text! + "\(buttonNumber)"
            }
        }
        behindNumber = Double(showTheAnswerLabel.text!) ?? 0
    }
    

    override func viewDidLoad() {
         super.viewDidLoad()
         // Do any additional setup after loading the view.
    }
}
