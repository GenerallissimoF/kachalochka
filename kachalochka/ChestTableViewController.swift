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
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return training.chest.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "chestCell", for: indexPath)
       
        var content = cell.defaultContentConfiguration()

       let exersiseType = training.chest[indexPath.row]
       
        switch exersiseType {
        case .inclineBenchPress: content.text = "Incline Bench Press"
        case .dumbbellBenchPress: content.text = "Dumbbel Bench Press"
        case .barbellBenchPress: content.text = "Barrbell Bench Press"
        }
        cell.contentConfiguration = content
       
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "seg2", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let currentVC = segue.destination as! CurrentTrainingTableViewController
        
        let indexPath = tableView.indexPathForSelectedRow!
        
        let exersiseType = training.chest[indexPath.row]
       
        switch exersiseType {
        case .inclineBenchPress(let exersise):
            currentVC.exersise = exersise
            currentVC.name = "Fucking incline Bench Press"
        case .dumbbellBenchPress(let exersise):
            currentVC.exersise = exersise
            currentVC.name = "Fucking dumbbell Bench Press"
        case .barbellBenchPress(let exersise):
            currentVC.exersise = exersise
            currentVC.name = "Fucking barbell Bench Press"
        }
        
    }
}

