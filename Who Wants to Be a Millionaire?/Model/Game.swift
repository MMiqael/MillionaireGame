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
    let resultsCaretaker = ResultsCaretaker()
    let settingsConfigCaretaker = SettingsConfigCaretaker()
    let customQuestionsCaretaker = CustomQuestionsCaretaker()
    
    private(set) var chosenMode: Int = 0 {
        didSet {
            settingsConfigCaretaker.saveConfig(with: chosenMode)
        }
    }
    
    private(set) var gameResult: [ResultStruct] = [] {
        didSet {
            resultsCaretaker.saveResult(results: gameResult)
        }
    }
    
    private(set) var customQuestions: [QuestionsStruct] = [] {
        didSet {
            customQuestionsCaretaker.saveQuestion(question: customQuestions)
        }
    }
    
    private init() {
        gameResult = resultsCaretaker.loadData()
        chosenMode = settingsConfigCaretaker.loadConfig()
        customQuestions = customQuestionsCaretaker.loadQuestions()
//        QuestionsStorage.shared.addQuestion(question: customQuestions)
    }
    
    func addResult() {
        guard let session = gameSession else { return }
        let percent = (session.correctAnswersCount * 100) / session.questionsCount
        let result = ResultStruct(percent: percent, questionsCount: session.questionsCount)
        gameResult.append(result)
        gameSession = nil
    }
    
    func changeModeStatus(index: Int) {
        if chosenMode != index {
            chosenMode = index
        }
    }
    
    func addQuestion(question: QuestionsStruct) {
        customQuestions.append(question)
    }
}
