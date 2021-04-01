//
//  GameViewController.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Микаэл Мартиросян on 20.03.2021.
//

import UIKit

class GameViewController: UIViewController {
        
    lazy var gameView = self.view as! GameView
                        
    private var selectedMode: GameMode {
        GameMode(rawValue: Game.shared.chosenMode) ?? .sequentially
    }
            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameView.gameViewDelegate = self
        startGame()
        
        guard let session = Game.shared.gameSession else { return }
        
        session.currentQuestionIndex.addObserver(self) { [weak self] score, _ in
            guard let declension = self?.determineDeclension(score: score) else { return }
            self?.gameView.scoreLabel.text = "Вы ответили на \(score) \(declension) из \(session.questionsCount)"
        }
    }
    
    private func startGame() {
        switch selectedMode {
        case .sequentially:
            return SequentiallyModeStrategy().getNewQuestion(view: gameView)
        case .randomly:
            return RandomlyModeStrategy().getNewQuestion(view: gameView)
        }
    }
    
    private func determineDeclension(score: Int) -> String {
        if (score % 10 == 1) && (score % 100 != 11) {
            return "вопрос"
        } else if (score % 10 >= 2) && (score % 10 <= 4) && ((score % 100 < 10) || (score % 100 > 20)) {
            return "вопроса"
        } else {
            return "вопросов"
        }
    }
    
    deinit {
        Game.shared.gameSession?.currentQuestionIndex.removeObserver(self)
    }
}

extension GameViewController: GameViewDelegate {
    
    func getNewQuestion() {
        
        guard let gameSession = Game.shared.gameSession else { return }
        
        gameSession.currentQuestionIndex.value += 1
        
        // MARK: Разобраться с таймерами
        if gameSession.currentQuestionIndex.value <= gameSession.questionsCount - 1 {
            _ = Timer.scheduledTimer(withTimeInterval: 2,
                                     repeats: false) { _ in
                self.startGame()
            }
        } else {
            gameView.questionLabel.text = "Вы ответили на вcе вопросы!\nПоздравляем! 🎉"
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
