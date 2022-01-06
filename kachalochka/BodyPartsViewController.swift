//
//  ExersiseTableViewController.swift
//  kachalochka
//
//  Created by Ivan Adoniev on 01.01.2022.
//

import UIKit

class BodyPartsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      
        var content = cell.defaultContentConfiguration()
        switch indexPath.row {
        case 0: content.text = "Chest"
        case 1: content.text = "Legs"
        default: content.text = "Back"
        }
    
        cell.contentConfiguration = content
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        if indexPath.row == 0 {
            performSegue(withIdentifier: "seg", sender: self)
          
            
        }
   
    }
    
    
}
