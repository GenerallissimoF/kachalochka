//
//  LegsTableViewController.swift
//  kachalochka
//
//  Created by Ivan Adoniev on 07.01.2022.
//

import UIKit

class LegsTableViewController: UITableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        training.legs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "legsCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        let exersiseType = training.legs[indexPath.row]
        
        switch exersiseType {
            case .squat: content.text = "Squat"
            case .frontSquat: content.text = "Front Squat"
            case .romanianDedlifts: content.text = "Romanian Deadlift"
        }
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "exSeg2", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let currentVC = segue.destination as! ExcersisesTableViewController
        
        let indexPath = tableView.indexPathForSelectedRow!
        
        let exersiseType = training.legs[indexPath.row]
        
        switch exersiseType {
            case .squat(let exersise):
                currentVC.exersise = exersise
                currentVC.name = "Do Squat!"
                currentVC.didChangeSet = { s, r, w in
                    training.setSquat(set: s, reps: Int(r)!, weight: Float(w)!)
                }
            case .frontSquat(let exersise):
                currentVC.exersise = exersise
                currentVC.name = "DoFront Squat!"
                currentVC.didChangeSet = { s, r, w in
                    training.setFrontSquat(set: s, reps: Int(r)!, weight: Float(w)!)
                }
            case .romanianDedlifts(let exersise):
                currentVC.exersise = exersise
                currentVC.name = "Do Romanian Deadlift!"
                currentVC.didChangeSet = { s, r, w in
                    training.setRomanianDedlifts(set: s, reps: Int(r)!, weight: Float(w)!)
                }
        }
    }
}
