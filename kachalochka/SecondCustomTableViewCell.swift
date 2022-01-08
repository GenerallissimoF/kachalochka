//
//  SecondCustomTableViewCell.swift
//  kachalochka
//
//  Created by Ivan Adoniev on 07.01.2022.
//

import UIKit

class SecondCustomTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var weightTF: UITextField!
    @IBOutlet weak var repsTF: UITextField!
    @IBOutlet weak var plusButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        weightTF.placeholder = "Enter weight"
        repsTF.placeholder = "reps"
        weightTF.delegate = self
        repsTF.delegate = self
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
  
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if  Int(weightTF.text!) ?? 0 < 100 {
            
            
            let alert = UIAlertController(title: "Go out", message: "U r fuckin drisch", preferredStyle: .alert)
            let alertButton = UIAlertAction.init(title: "OK", style: .default, handler: nil)
            alert.addAction(alertButton)
         
            
            
        }
    }
}
