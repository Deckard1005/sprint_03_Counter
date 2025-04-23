import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var counterValue: UILabel!
    @IBOutlet private weak var counterButtonPlus: UIButton!
    @IBOutlet private weak var counterButtonMinus: UIButton!
    @IBOutlet private weak var counterDownToZero: UIButton!
    @IBOutlet private weak var history: UITextView!
    
    private var counter: Int = 0
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterValue.text = "Значение счётчика: \(counter)"
        counterButtonPlus.setTitle("+", for: .normal)
        history.isEditable = false
        history.isScrollEnabled = true
        history.text = "История изменений: \n"
    }
    
    private func logHistory(_ message: String) {
        let time = dateFormatter.string(from: Date())
        let entry = "\(time): \(message)\n"
        history.text += entry
        
    }
    
    @IBAction private func counterIncrease(_ sender: Any) {
        if counter < Int.max {
            counter += 1
        } else {
            counter = Int.max
        }
        counterValue.text = "Значение счётчика: \(counter)"
        logHistory("значение изменено на +1")
    }
    
    
    @IBAction private func counterDecrease(_ sender: Any) {
        if counter <= 0 {
            counter = 0
            logHistory("попытка уменьшить значение счётчика ниже 0")
        } else {
            counter -= 1
            logHistory("значение изменено на -1")
        }
        counterValue.text = "Значение счётчика: \(counter)"
    }
    
    @IBAction private func counterDownToZero(_ sender: Any) {
        counter = 0
        counterValue.text = "Значение счётчика: \(counter)"
        logHistory("значение сброшено")
    }
    
}

