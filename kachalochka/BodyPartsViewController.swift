//
//  ExersiseTableViewController.swift
//  kachalochka
//
//  Created by Ivan Adoniev on 01.01.2022.
//

import UIKit

class BodyPartsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let cellSpacingHeight: CGFloat = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func layoutSubviews() {
        tableView.layer.cornerRadius = 5
       }

    // MARK: - Table view data source
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomViewCell
        
        switch indexPath.row {
        case 0: cell.cellLabel.text = "Chest"
        case 1: cell.cellLabel.text = "Legs"
        default: cell.cellLabel.text = "Back"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            performSegue(withIdentifier: "chestSeg", sender: self)
        } else if indexPath.row == 1 {
            performSegue(withIdentifier: "legsSeg", sender: self)
        } else {
            performSegue(withIdentifier: "backSeg", sender: self)
        }
    }
}
