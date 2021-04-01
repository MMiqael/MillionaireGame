//
//  GameSession.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Микаэл Мартиросян on 21.03.2021.
//

import Foundation

final class GameSession {
        
    var questionsCount = 0
    var correctAnswersCount = 0
    
    var currentQuestionIndex = Observable<Int>(0)
    
    var askedRandomQuestions: [QuestionsStruct] = []
    
    let defaultQuestionStorage = QuestionsStorage.shared.questions
    let shuffledQuestionStorage = QuestionsStorage.shared.questions.shuffled()
    
    init(questionsCount: Int) {
        self.questionsCount = questionsCount
    }
}
