//
//  ChestTableViewController.swift
//  kachalochka
//
//  Created by Ivan Adoniev on 03.01.2022.
//

import UIKit

class ChestTableViewController: UITableViewController {
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "chestCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "chestCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        switch indexPath.row {
        case 0: content.text = "Dumbbel Bench Press"
        case 1: content.text = "Barrbell Bench Press"
        default: content.text = "Incline Bench Press"
        }
        cell.contentConfiguration = content

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
       
        let currentVC = CurrentTrainingTableViewController()
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
     
          
            currentVC.workout?.chest[indexPath.row] = training.chest[indexPath.row]
           
            navigationController?.pushViewController(currentVC, animated: true)
            
        }
    }

