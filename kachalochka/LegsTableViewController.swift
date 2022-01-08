//
//  LegsTableViewController.swift
//  kachalochka
//
//  Created by Ivan Adoniev on 07.01.2022.
//

import UIKit

class LegsTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return training.legs.count
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
            currentVC.name = "Do Squt!"
        case .frontSquat(let exersise):
            currentVC.exersise = exersise
            currentVC.name = "Do Squt!"
        case .romanianDedlifts(let exersise):
            currentVC.exersise = exersise
            currentVC.name = "Do Deadlift!"
        }
    }
}
