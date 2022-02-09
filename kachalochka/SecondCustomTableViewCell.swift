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
    
   
   
    var weightValue = ""
    var repsValue = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let vk = ExcersisesTableViewController()
        vk.delegate = self
        
        weightTF.placeholder = "Enter weight"
        repsTF.placeholder = "reps"
        weightTF.delegate = self
        repsTF.delegate = self
        
        
        weightValue = UserDefaults.standard.string(forKey: "weight") ?? "0"
        repsValue = UserDefaults.standard.string(forKey: "reps") ?? "0"
        
        
        weightTF.text = weightValue
        repsTF.text = repsValue
        
    }
    
}
extension SecondCustomTableViewCell: ExcersisesTableViewControllerDelegate {
    
    func didEnterWeight(reps: String, weight: String) {
        
        UserDefaults.standard.set(reps, forKey: "reps")
        UserDefaults.standard.set(weight, forKey: "weight")
        print(reps)
        
    }
}
