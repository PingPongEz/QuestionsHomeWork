//
//  ViewController.swift
//  QuestionsHomeWork
//
//  Created by u on 23.03.2022.
//

import UIKit

class StartViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func unwindToStart(_ unwindSegue: UIStoryboardSegue) {
        guard let source = unwindSegue.source as? ResultViewController else { return }
        source.currentAnimal = nil
    }
    
}

