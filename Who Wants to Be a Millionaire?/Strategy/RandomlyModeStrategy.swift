//
//  RandomlyModeStrategy.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Микаэл Мартиросян on 30.03.2021.
//

import Foundation

final class RandomlyModeStrategy: GameStrategy {
        
    func getNewQuestion(view: GameView) {
        
        guard let gameSession = Game.shared.gameSession else { return }
        guard let buttons = view.answersCollection else { return }
        
        let nextQuestion = gameSession.shuffledQuestionStorage[gameSession.currentQuestionIndex.value]
        
        for index in nextQuestion.answers.indices {
            buttons[index].setTitle(nextQuestion.answers[index], for: .normal)
        }
            
        view.questionLabel.text = nextQuestion.question
        view.correctAnswer = nextQuestion.correctAnswer
    }
}
