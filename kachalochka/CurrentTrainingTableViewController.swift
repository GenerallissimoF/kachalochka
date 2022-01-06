//
//  CurrentTrainingTableViewController.swift
//  kachalochka
//
//  Created by Ivan Adoniev on 04.01.2022.
//

import UIKit

class CurrentTrainingTableViewController: UITableViewController {
  
    var exersise: Excersise?
    var name: String?
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        name
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "currentCell", for: indexPath)
       // let trainingg = workout?.chest[indexPath.row]
       
        var content = cell.defaultContentConfiguration()
        content.text = "000"
        cell.contentConfiguration = content
        return cell
    }
}
