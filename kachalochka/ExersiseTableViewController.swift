//
//  ExersiseTableViewController.swift
//  kachalochka
//
//  Created by Ivan Adoniev on 01.01.2022.
//

import UIKit

class ExersiseTableViewController: UITableViewController {
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let training = training.chest[indexPath.row]
        var content = cell.defaultContentConfiguration()
        switch indexPath.row {
        case 0: content.text = "Chest"
        case 1: content.text = "Legs"
        default: content.text = "Back"
        }
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        if indexPath.row == 0 {
        let chestVC = ChestTableViewController()
        
            
            navigationController?.pushViewController(chestVC, animated: true)
            
        }
        
        
        
    }
    
    
}
