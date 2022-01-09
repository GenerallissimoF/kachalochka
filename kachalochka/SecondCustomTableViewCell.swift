//
//  SecondCustomTableViewCell.swift
//  kachalochka
//
//  Created by Ivan Adoniev on 07.01.2022.
//

import UIKit
protocol SecondCustomTableViewCellDelegate {
    func drischChecking()
}
class SecondCustomTableViewCell: UITableViewCell, UITextFieldDelegate {
    
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
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //я так понял что здесь надо прописать еще одно условие if exersise == бла-бла-бла или
        // if name, чтобы сделать ограничение по весу для каждого упражнения, но как мне обратииься к этим данным которые находятся в ExcersisesTableViewController?
        //
        if  Int(weightTF.text!) ?? 0 < 100 {
            delegate?.drischChecking()
        }
    }
}
