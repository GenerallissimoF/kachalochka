//
//  CurrentTrainingTableViewController.swift
//  kachalochka
//
//  Created by Ivan Adoniev on 04.01.2022.
//

import UIKit
protocol ExcersisesTableViewControllerDelegate {
   func didEnterWeight(reps: String, weight: String)
}

class ExcersisesTableViewController: UITableViewController {
  
   var exersise: Excersise?
    var name: String? 

    var delegate: ExcersisesTableViewControllerDelegate?
    
    override func viewDidLoad() {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        let customVc = SecondCustomTableViewCell()
        delegate?.didEnterWeight(reps: customVc.repsValue, weight: customVc.weightValue)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exersise?.set ?? 0
       
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        name
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "secondCustCell", for: indexPath) as! SecondCustomTableViewCell
     
        cell.plusButton.tag = indexPath.row
        cell.plusButton.addTarget(self, action: #selector(plusButtonWasPress(_sender:)), for: .touchUpInside)
        
        return cell
    }

    @objc func plusButtonWasPress(_sender: UIButton) {
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath.init(row: exersise?.set ?? 0 + 1 , section: 0)], with: .automatic)
        exersise?.set += 1
        tableView.endUpdates()
    }

}

