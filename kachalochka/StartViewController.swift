//
//  StartViewController.swift
//  kachalochka
//
//  Created by Ivan Adoniev on 30.12.2021.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var exerciseButton: UIButton!
    
    @IBOutlet weak var statisticButton: UIButton!
    
    @IBOutlet weak var savedTrainingButton: UIButton!
    
    
    override func viewDidLoad() {
        guard let image = UIImage(named: "777") else { return }
        view.backgroundColor = UIColor(patternImage: image)
        initTraining()
    }
}
