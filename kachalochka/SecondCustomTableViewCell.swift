//
//  SecondCustomTableViewCell.swift
//  kachalochka
//
//  Created by Ivan Adoniev on 07.01.2022.
//

import UIKit
protocol SecondCustomTableViewCellDelegate {
    func drischChecking()
   func didEnterWeight(weightTF: String, repsTF: String, set: String)
    
}
class SecondCustomTableViewCell: UITableViewCell, UITextFieldDelegate {
    let set = "1"
    @IBOutlet weak var weightTF: UITextField!
    @IBOutlet weak var repsTF: UITextField!
    @IBOutlet weak var plusButton: UIButton!
    
    var delegate: SecondCustomTableViewCellDelegate?
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        weightTF.placeholder = "Enter weight"
        repsTF.placeholder = "reps"
        weightTF.delegate = self
        repsTF.delegate = self
        delegate?.didEnterWeight(weightTF: weightTF.text!, repsTF: repsTF.text!, set: set)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if  Int(weightTF.text!) ?? 0 < 100 {
            delegate?.drischChecking()
        }
       
        
    }
}
