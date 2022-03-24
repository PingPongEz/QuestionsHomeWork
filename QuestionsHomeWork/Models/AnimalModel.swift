//
//  AnimalModel.swift
//  QuestionsHomeWork
//
//  Created by u on 24.03.2022.
//

import Foundation

struct AnimalDescription {
    
    static func getDescription(animal: Animal) -> String {
        switch animal {
        case .dog:
           return "Вы очень верный друг и всегда готовы постоять за своего лучшего в мире хозяина"
        case .cat:
           return "Вам абсолютно всё-равно на ваших хозяев. Главное чтобы вас хорошо кормили"
        case .parrot:
           return "Вы любите будить своего хозяина летом в 4 утра просто потому что"
        case .rabbit:
           return "Вы очень любите кушать обои и какать по-углам"
        default: return "Вы ничто"
        }
    }
    
}
