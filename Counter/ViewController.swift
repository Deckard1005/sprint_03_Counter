//
//  ViewController.swift
//  Counter
//
//  Created by Dmitrii Rykov on 18. 4. 2025..
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterValue: UILabel!
    
    @IBOutlet weak var counterButtonPlus: UIButton!
    
    @IBOutlet weak var counterButtonMinus: UIButton!
    
    @IBOutlet weak var counterDownToZero: UIButton!
    
    @IBOutlet weak var history: UITextView!
    
    
    var counter: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        counterValue.text = "Значение счётчика: \(counter)"
        counterButtonPlus.setTitle("+", for: .normal)
        history.isEditable = false
        history.isScrollEnabled = true
        history.text = "История изменений: \n"
        // Do any additional setup after loading the view.
    }

    @IBAction func counterIncrease(_ sender: Any) {
        if counter < Int.max {
            counter += 1
        } else {
            counter = Int.max
        }
        counterValue.text = "Значение счётчика: \(counter)"
        logHistory("значение изменено на +1")
    }
    
    
    @IBAction func counterDecrease(_ sender: Any) {
        if counter <= 0 {
            counter = 0
            logHistory("попытка уменьшить значение счётчика ниже 0")
        } else {
            counter -= 1
            logHistory("значение изменено на -1")
        }
        counterValue.text = "Значение счётчика: \(counter)"
    }
    
    @IBAction func counterDownToZero(_ sender: Any) {
        counter = 0
        counterValue.text = "Значение счётчика: \(counter)"
        logHistory("значение сброшено")
    }
    
    func logHistory(_ message: String) {
        let time = Date().formatted(date: .numeric, time: .standard)
        let entry = "\(time): \(message)\n"
        history.text += entry
        
    }
    
}

