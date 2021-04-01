//
//  AddQuestionViewController.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Микаэл Мартиросян on 31.03.2021.
//

import UIKit

class AddQuestionViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var enterQuestionLabel: UILabel!
    @IBOutlet weak var enterQuestionTextField: UITextField!
    
    @IBOutlet weak var enterAnswersLabel: UILabel!
    @IBOutlet var enterAnswersTextFieldCollection: [UITextField]!
    
    @IBOutlet weak var enterCorrectAnswerLabel: UILabel!
    @IBOutlet weak var enterCorrectAnswerTextField: UITextField!
    
    @IBOutlet weak var addQuestionOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addQuestionOutlet.layer.cornerRadius = 10
    }
    
    // MARK: Вынести проверки и алерты
    @IBAction func addQuestionAction(_ sender: UIButton) {
        
        guard let checkQuestion = enterQuestionTextField.text else { return }
        guard checkQuestion != "" else { return emptyTextFiledAlert() }
        var question: String {
            var question = checkQuestion
        
            if question.last != "?" {
                question.append("?")
            }
            
            // MARK: Добавить изменение регистра первого символа вопроса
            
            return question
        }
        
        
        guard let answers = enterAnswersTextFieldCollection else { return }
        var answersArray: [String] = []
        
        for answer in answers {
            guard let text = answer.text else { return }
            guard text != "" else { return emptyTextFiledAlert() }
            guard !answersArray.contains(text) else { return sameAnswersAlert() }
            
            
            answersArray.append(text.capitalized)
        }
        
        guard let checkCorrectAnswer = enterCorrectAnswerTextField.text else { return }
        guard checkCorrectAnswer != "" else { return emptyTextFiledAlert() }
        var correctAnswer: String {
            checkCorrectAnswer.capitalized
        }
        
        guard answersArray.contains(correctAnswer) else { return incorrectAnswerAlert() }
        
        saveQuestion(question: QuestionsStruct(question: question, answers: answersArray, correctAnswer: correctAnswer))
    }
    
    private func emptyTextFiledAlert() {
        let alert = UIAlertController(title: "Ошибка добавления", message: "Заполните все поля", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Попробовать снова", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    private func sameAnswersAlert() {
        let alert = UIAlertController(title: "Ошибка добавления", message: "Варианты ответа не должны повторяться", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Попробовать снова", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    private func incorrectAnswerAlert() {
        let alert = UIAlertController(title: "Ошибка добавления", message: "Данного ответа нет среди указанных вариантов", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Попробовать снова", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    func saveQuestion(question: QuestionsStruct) {
        Game.shared.addQuestion(question: question)
        self.dismiss(animated: true, completion: nil)
    }
}
