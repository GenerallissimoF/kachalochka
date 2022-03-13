//
//  CurrentTrainingTableViewController.swift
//  kachalochka
//
//  Created by Ivan Adoniev on 04.01.2022.
//

import UIKit

class ExcersisesTableViewController: UITableViewController {
    
    var exersise: [Excersise] = []
    var name: String?
    
    let customVc = SecondCustomTableViewCell()
    var didChangeSet: ((Int, String, String) -> Void)?
    var didAddSet: ((Int) -> Void)?
    var didRemoveSet: ((Int) -> Void)?
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        exersise.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        name
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        customVc.delegate = self
        let cell = tableView.dequeueReusableCell(withIdentifier: "secondCustCell", for: indexPath) as! SecondCustomTableViewCell
        cell.delegate = self
        cell.index = indexPath.row + 1
        
        cell.plusButton.tag = indexPath.row
        cell.plusButton.addTarget(self, action: #selector(plusButtonWasPressed(sender:)), for: .touchUpInside)
        
        cell.minusButton.tag = indexPath.row
        cell.minusButton.addTarget(self, action: #selector(minusButtonWasPressed(sender:)), for: .touchUpInside)
        cell.setLabel.text = String(indexPath.row + 1)
        return cell
    }
    
    @objc func plusButtonWasPressed(sender: UIButton) {
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath.init(row: sender.tag + 1 , section: 0)], with: .automatic)
        didAddSet?(sender.tag + 1)
        tableView.endUpdates()
    }
    
    @objc func minusButtonWasPressed(sender: UIButton) {
        tableView.beginUpdates()
        tableView.deleteRows(at: [IndexPath.init(row: sender.tag, section: 0)], with: .automatic)
        didRemoveSet?(sender.tag)
        tableView.endUpdates()
    }
}
extension ExcersisesTableViewController: SecondCustomTableViewCellDelegate {
    
    func didEnter(set: Int, reps: String, weight: String) {
        didChangeSet?(set, reps, weight)
    }
}


