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
    
    
    override func viewDidLoad() {
    
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
     
        cell.delegate = self
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
extension ExcersisesTableViewController: SecondCustomTableViewCellDelegate {

      func drischChecking() {
    
          let alert = UIAlertController(title: "Go out!!!", message: "Too little weight!!!", preferredStyle: .alert)
          let alertButton = UIAlertAction.init(title: "OK", style: .default, handler: nil)
          alert.addAction(alertButton)
          present(alert, animated: true, completion: nil)
      }
}

