//
//  ResultViewController.swift
//  QuestionsHomeWork
//
//  Created by u on 23.03.2022.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var congratulationMessage: UILabel!
    @IBOutlet var descriptionMessage: UILabel!
    
    
    @IBOutlet var navigationBar: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.hidesBackButton = true
        
    }

    
    
}
