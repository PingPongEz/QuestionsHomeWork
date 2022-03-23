//
//  QuestionsModel.swift
//  QuestionsHomeWork
//
//  Created by u on 23.03.2022.
//

import Foundation

struct Questions {
    
    let title: String
    let answers: [Answer]
    let typeOfAnswer: AnswerType
    
    static func getQuestions() -> [Questions] {
        return [
        Questions(title: "Какую пищу вы любите?",
                  answers: [
                    Answer(question: "Стейк", animal: .dog),
                    Answer(question: "Рыбу", animal: .cat),
                    Answer(question: "Зерна", animal: .parrot),
                    Answer(question: "Морковь", animal: .rabbit)
                  ],
                  typeOfAnswer: .single),
        Questions(title: "Что вам нравится больше",
                  answers: [
                    Answer(question: "Спать", animal: .cat),
                    Answer(question: "Гулять", animal: .dog),
                    Answer(question: "Обниматься", animal: .rabbit),
                    Answer(question: "Кричать", animal: .parrot),
                  ],
                  typeOfAnswer: .multiple),
        Questions(title: "На сколько вы любите кататься на машине?",
                  answers: [
                    Answer(question: "Ненавижу", animal: .cat),
                    Answer(question: "Нервничаю", animal: .rabbit),
                    Answer(question: "Не замечаю", animal: .parrot),
                    Answer(question: "Обожаю", animal: .dog)
                  ],
                  typeOfAnswer: .ranged)
        ]
    }
}


struct Answer {
    
    let question: String
    let animal: Animal
    
}

enum Animal {
    case dog
    case cat
    case parrot
    case rabbit
}

enum AnswerType {
    case single
    case multiple
    case ranged
}
