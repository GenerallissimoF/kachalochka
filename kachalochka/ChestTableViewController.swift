//
//  ChestTableViewController.swift
//  kachalochka
//
//  Created by Ivan Adoniev on 03.01.2022.
//

import UIKit

class ChestTableViewController: UITableViewController {
    
    @IBAction func traningList(_ sender: UIBarButtonItem) {
        
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        training.chest.count
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
        performSegue(withIdentifier: "exSeg1", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let currentVC = segue.destination as! ExcersisesTableViewController
        
        let indexPath = tableView.indexPathForSelectedRow!
        
        let exersiseType = training.chest[indexPath.row]
        
        switch exersiseType {
            case .inclineBenchPress(let exersise):
                currentVC.exersise = exersise
                currentVC.name = "Incline Bench Press"
            case .dumbbellBenchPress(let exersise):
                currentVC.exersise = exersise
                currentVC.name = "Dumbbell Bench Press"
            case .barbellBenchPress(let exersise):
                currentVC.exersise = exersise
                currentVC.name = "Barbell Bench Press"
        }
    }
}

