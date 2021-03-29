//
//  ViewController.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Микаэл Мартиросян on 20.03.2021.
//

import UIKit

class GameViewController: UIViewController {
        
    lazy var gameView = self.view as! GameView
        
    private var questionsList = QuestionStorage.questions
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameView.gameViewDelegate = self
        startGame()
    }
    
    private func startGame() {
        guard let randomQ = questionsList.randomElement() else { return }
        guard let buttons = gameView.answersCollection else { return }
        
        for index in randomQ.answers.indices {
            buttons[index].setTitle(randomQ.answers[index], for: .normal)
        }
        
        gameView.questionLabel.text = randomQ.question
        gameView.correctAnswer = randomQ.correctAnswer
        gameView.currentQuestionIndex = questionsList.firstIndex { $0.question == randomQ.question }
    }
}

extension GameViewController: GameViewDelegate {
    
    // MARK: Не смог разобраться, как передать очки делегатом/замыканием в GameSession
    func getNewQuestion(index: Int) {
        Game.shared.gameSession?.correctAnswersCount += 1
        questionsList.remove(at: index)
        if questionsList.count > 0 {
            _ = Timer.scheduledTimer(withTimeInterval: 2,
                                     repeats: false) { _ in
                self.startGame()
            }
        } else {
            gameView.questionLabel.text = "Вы ответили на вcе вопросы!\nПоздравляем!"
            _ = Timer.scheduledTimer(withTimeInterval: 2,
                                     repeats: false) { _ in
                self.gameOver()
            }
        }
    }
    
    func gameOver() {
        Game.shared.addResult()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
