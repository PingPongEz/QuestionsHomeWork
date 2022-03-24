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
    
    var animals: [Answer]!
    var currentAnimal: Animal!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        calculateAnimals()
        
        congratulationMessage.text = "Поздравляем! Вы - \(currentAnimal.rawValue)"
        descriptionMessage.text = AnimalDescription.getDescription(animal: currentAnimal)
        
    }
    
}

extension ResultViewController {
    private func calculateAnimals() {
        
        var dictionaryOfAnimals: [Animal : Int] = [:]
        var maximumTimeAnimalUsed = 0
        
        for answer in animals {
            if let animal = dictionaryOfAnimals[answer.animal] {
                dictionaryOfAnimals[answer.animal] = animal + 1
            } else {
                dictionaryOfAnimals[answer.animal] = 1
            }
            
            for (animal, count) in dictionaryOfAnimals {
                if count > maximumTimeAnimalUsed {
                    maximumTimeAnimalUsed = count
                    currentAnimal = animal
                }
            }
            
//            let animalsArray = animals.map { $0.animal }
            
            let sortedFrequencyOfAnimals = dictionaryOfAnimals.sorted { $0.value > $1.value }
            currentAnimal = sortedFrequencyOfAnimals.first?.key
         }
    }
}
