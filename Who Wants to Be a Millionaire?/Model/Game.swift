//
//  Game.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Микаэл Мартиросян on 21.03.2021.
//

import Foundation

final class Game {
    
    static let shared = Game()
    
    var gameSession: GameSession?
    let caretaker = Caretaker()
    
    private(set) var gameResult: [ResultStruct] = [] {
        didSet {
            caretaker.saveResult(results: gameResult)
        }
    }
    
    private init() {
        self.gameResult = caretaker.loadData()
    }
    
    func addResult() {
        guard let session = gameSession else { return }
        let percent = (session.correctAnswersCount * 100) / QuestionStorage.questions.count
        let result = ResultStruct(percent: percent)
        gameResult.append(result)
        gameSession = nil
    }
}
