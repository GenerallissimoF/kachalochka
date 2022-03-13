//
//  SecondCustomTableViewCell.swift
//  kachalochka
//
//  Created by Ivan Adoniev on 07.01.2022.
//

import UIKit

protocol SecondCustomTableViewCellDelegate: AnyObject {
    func didEnter(set: Int, reps: String, weight: String)
}

class SecondCustomTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var weightTF: UITextField!
    @IBOutlet weak var repsTF: UITextField!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var setLabel: UILabel!
    
    
    weak var delegate: SecondCustomTableViewCellDelegate?
    
    var weightValue = ""
    var repsValue = ""
    var index: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        weightTF.placeholder = "Enter weight"
        repsTF.placeholder = "reps"
        weightTF.delegate = self
        repsTF.delegate = self
        
        
        weightValue = weightTF.text!
        repsValue = repsTF.text!
        weightTF.text = weightValue
        repsTF.text = repsValue
        
        repsTF.text = UserDefaults.standard.string(forKey: "reps") ?? "0"
        weightTF.text = UserDefaults.standard.string(forKey: "weight") ?? "0"
    }
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        weightTF.returnKeyType = .next
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == repsTF {
            endEditing(true)
        }
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        repsTF.resignFirstResponder()
        delegate?.didEnter(set: index, reps: repsTF.text!, weight: weightTF.text!)
    }
}
