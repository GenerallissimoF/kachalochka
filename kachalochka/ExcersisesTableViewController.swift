//
//  CurrentTrainingTableViewController.swift
//  kachalochka
//
//  Created by Ivan Adoniev on 04.01.2022.
//

import UIKit

class ExcersisesTableViewController: UITableViewController {
    
    var exersise: Excersise?
    var name: String?
    var setOfTheExercise = [Excersise]()
    
    let customVc = SecondCustomTableViewCell()
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        exersise?.set ?? 0
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        name
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        customVc.delegatte = self
        let cell = tableView.dequeueReusableCell(withIdentifier: "secondCustCell", for: indexPath) as! SecondCustomTableViewCell
        cell.delegatte = self
        
        cell.plusButton.tag = indexPath.row
        cell.plusButton.addTarget(self, action: #selector(plusButtonWasPressed(_sender:)), for: .touchUpInside)
        
        cell.minusButton.tag = indexPath.row
        cell.minusButton.addTarget(self, action: #selector(minusButtonWasPressed(_sender:)), for: .touchUpInside)
        cell.setLabel.text = String(indexPath.row + 1)
        return cell
    }
    
    @objc func plusButtonWasPressed(_sender: UIButton) {
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath.init(row: exersise?.set ?? 0 , section: 0)], with: .automatic)
        exersise?.set += 1
        tableView.endUpdates()
    }
    
    @objc func minusButtonWasPressed(_sender: UIButton) {
        tableView.beginUpdates()
        tableView.deleteRows(at: [IndexPath.init(row: exersise!.set - 1, section: 0)], with: .automatic)
        exersise?.set -= 1
        tableView.endUpdates()
    }
}
extension ExcersisesTableViewController: SecondCustomTableViewCellDelegate {
    func didEnterWeight(reps: String, weight: String) {
        
        UserDefaults.standard.set(reps, forKey: "reps")
        UserDefaults.standard.set(weight, forKey: "weight")
    }
}


