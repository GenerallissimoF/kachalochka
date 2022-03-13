//
//  BackTableViewController.swift
//  kachalochka
//
//  Created by Ivan Adoniev on 07.01.2022.
//

import UIKit

class BackTableViewController: UITableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        training.back.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "backCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        let exersiseType = training.back[indexPath.row]
        
        switch exersiseType {
            case .barbelRow: content.text = "Barbell Row"
            case .deadlift: content.text = "Deadlift"
            case .pullUps: content.text = "Pull Ups"
        }
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "exSeg3", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let currentVC = segue.destination as! ExcersisesTableViewController
        
        let indexPath = tableView.indexPathForSelectedRow!
        
        let exersiseType = training.back[indexPath.row]
        
        switch exersiseType {
            case .barbelRow(let exersise):
                currentVC.exersise = exersise
                currentVC.name = "Do Barbell Row!"
                currentVC.didChangeSet = { s, r, w in
                    training.setBarbelRow(set: s, reps: Int(r)!, weight: Float(w)!)
                }
            case .deadlift(let exersise):
                currentVC.exersise = exersise
                currentVC.name = "Do Deadlift!"
                currentVC.didChangeSet = { s, r, w in
                    training.setDeadlift(set: s, reps: Int(r)!, weight: Float(w)!)
                }
            case .pullUps(let exersise):
                currentVC.exersise = exersise
                currentVC.name = "Do Pull Ups!"
                currentVC.didChangeSet = { s, r, w in
                    training.setPullUps(set: s, reps: Int(r)!, weight: Float(w)!)
                }
        }
    }
}
