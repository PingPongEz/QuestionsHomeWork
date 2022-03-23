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
    @IBOutlet var rangedSlider: UISlider! {
        didSet {
            let answerRange = Float(currentAnswers.count) - 1
            rangedSlider.maximumValue = answerRange
            rangedSlider.minimumValue = 0
            rangedSlider.value = answerRange / 2
        }
    }
    
    private let questions = Questions.getQuestions()
    private var currentQuestion: Questions {
        questions[currentQuestionIndex]
    }
    private var currentAnswers: [Answer] {
        currentQuestion.answers
    }
    private var currentQuestionIndex = 0
    private var answersChosen: [Answer] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        updateUI()
    }
    
    
    @IBAction func singleQuestionDone(_ sender: UIButton) {
        guard let currentIndex = singleAnswerButton.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswers[currentIndex]
        answersChosen.append(currentAnswer)
        nextQuestion()
    }
    
    @IBAction func multipleQuestionsDone() {
        var variantsChosen = 0
        for (index, switchValue) in multipleAnswerSwitch.enumerated() {
            if switchValue.isOn {
                answersChosen.append(currentQuestion.answers[index])
                variantsChosen += 1
            }
        }
        if variantsChosen == 0 {
            return
        }
        nextQuestion()
    }
    
    @IBAction func rangedQuestionDone() {
        let result = lrintf(rangedSlider.value)
        answersChosen.append(currentQuestion.answers[result])
        nextQuestion()
        print(answersChosen)
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
        
        showCurrentQuestion(for: currentQuestion.typeOfAnswer)
    }
    
    private func showCurrentQuestion(for type: AnswerType) {
        switch type {
        case .single: showSingleAnswerView(with: currentAnswers)
        case .multiple: showMultipleAnswerView(with: currentAnswers)
        case .ranged: showRangedAnswerView(with: currentAnswers)
        }
    }
    
    private func showSingleAnswerView(with answers: [Answer]) {
        singleAnswerQuestion.isHidden = false
        for (button, answer) in zip(singleAnswerButton, answers) {
            button.setTitle(answer.question, for: .normal)
        }
    }
    
    private func showMultipleAnswerView(with answers: [Answer]) {
        multipleAnswerQuestion.isHidden = false
        for (title, answer) in zip(multipleAnswerLabels, answers) {
            title.text = answer.question
        }
    }
    
    private func showRangedAnswerView(with answers: [Answer]) {
        rangedAnswerQuestion.isHidden = false
        rangedLabels.first?.text = answers.first?.question
        rangedLabels.last?.text = answers.last?.question
    }
    
    private func nextQuestion() {
        currentQuestionIndex += 1
        if currentQuestionIndex < questions.count {
            updateUI()
            return
        }
        performSegue(withIdentifier: "results", sender: nil)
    }
}

