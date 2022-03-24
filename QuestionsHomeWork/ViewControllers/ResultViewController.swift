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
        
        switch currentWinner {
        case .cat:
            congratulationMessage.text = "Поздравляем! Вы - 🐱"
            descriptionMessage.text = "Вам абсолютно всё-равно на ваших хозяев. Главное чтобы вас хорошо кормили"
        case .dog:
            congratulationMessage.text = "Поздравляем! Вы - 🐶"
            descriptionMessage.text = "Вы очень верный друг и всегда готовы постоять за своего лучшего в мире хозяина"
        case .rabbit:
            congratulationMessage.text = "Поздравляем! Вы - 🐰"
            descriptionMessage.text = "Вы очень любите кушать обои и какать по-углам"
        case .parrot:
            congratulationMessage.text = "Поздравляем! Вы - 🐤"
            descriptionMessage.text = "Вы любите будить своего хозяина летом в 4 утра просто потому что"
        default:
            congratulationMessage.text = "Поздравляем! Вы - Ничто"
        }
        
    }

    
    
}
