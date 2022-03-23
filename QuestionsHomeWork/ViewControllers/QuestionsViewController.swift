//
//  QuestionsViewController.swift
//  QuestionsHomeWork
//
//  Created by u on 23.03.2022.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    
    
    @IBOutlet var singleAnswerQuestion: UIStackView!
    @IBOutlet var singleAnswerButton: [UIButton]!
    
    
    @IBOutlet var multipleAnswerQuestion: UIStackView!
    @IBOutlet var multipleAnswerLabels: [UILabel]!
    @IBOutlet var multipleAnswerSwitch: [UISwitch]!

    @IBOutlet var rangedAnswerQuestion: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet var rangedSlider: UISlider!
    
    private let questions = Questions.getQuestions()
    private var currentAnswers: [Answer] {
        questions[currentQuestionIndex].answers
    }
    private let currentQuestionIndex = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }

    @IBAction func goTo() {
        
    }
    
    @IBAction func multipleQuestionsDone() {
    }
    
    @IBAction func rangedQuestionDone() {
    }
}

//MARK: Private methods
extension QuestionsViewController {

    private func updateUI() {
        for stack in [singleAnswerQuestion, multipleAnswerQuestion, rangedAnswerQuestion] {
            stack?.isHidden = true
        }
        
        let currentQuestion = questions[currentQuestionIndex]
        
        questionLabel.text = currentQuestion.title
        
        let currentProgress = Float(currentQuestionIndex) / Float(questions.count)
        
        progressBar.setProgress(currentProgress, animated: true)
        
        title = "Вопрос № \(currentQuestionIndex + 1) из \(questions.count)"
        
    }
    
    private func showCurrentQuestion(for type: AnswerType) {
        switch type {
        case .single: showSingleAnswerView(with: currentAnswers)
        case .multiple: multipleAnswerQuestion.isHidden = false
        case .ranged: rangedAnswerQuestion.isHidden = false
        }
    }
    
    private func showSingleAnswerView(with answers: [Answer]) {
        for (button, answer) in zip(singleAnswerButton, answers) {
            button.setTitle(answer.question, for: .normal)
        }
    }
    
}
