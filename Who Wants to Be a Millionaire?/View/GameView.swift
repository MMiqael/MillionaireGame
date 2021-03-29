//
//  GameView.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Микаэл Мартиросян on 27.03.2021.
//

import UIKit

protocol GameViewDelegate: class {
    func getNewQuestion(index: Int)
    func gameOver()
}

class GameView: UIView {
    
    weak var gameViewDelegate: GameViewDelegate?
    
    var correctAnswer: String?
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answersCollection: [UIButton]!
    
    var currentQuestionIndex: Int?
    
    override func awakeFromNib() {
        questionLabel.backgroundColor = .systemIndigo
        setupConfig()
    }
    
    // MARK: Установить анимации на background
    @IBAction func tapOnAnswer(_ sender: UIButton) {
        
        guard let title = sender.titleLabel?.text else { return }
        
        sender.backgroundColor = .systemYellow
        
        if title == correctAnswer {
            _ = Timer.scheduledTimer(withTimeInterval: 2,
                                     repeats: false) { _ in
                sender.backgroundColor = .systemGreen
                guard let index = self.currentQuestionIndex else { return }
                self.gameViewDelegate?.getNewQuestion(index: index)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.setupConfig()
                }
            }
        } else {
            for button in answersCollection {
                _ = Timer.scheduledTimer(withTimeInterval: 2,
                                         repeats: false) { _ in
                    guard let buttonTitle = button.titleLabel?.text else { return }
                    if buttonTitle == self.correctAnswer {
                        DispatchQueue.main.async {
                            self.questionLabel.text = "Вы проиграли"
                            button.backgroundColor = .systemGreen
                        }
                    }
                    self.gameViewDelegate?.gameOver()
                }
            }
        }
    }
    
    private func setupConfig() {
        answersCollection.forEach { $0.backgroundColor = .systemIndigo }
    }
}
