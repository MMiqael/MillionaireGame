//
//  CustomQuestionsCaretaker.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Микаэл Мартиросян on 31.03.2021.
//

import Foundation

final class CustomQuestionsCaretaker {
    
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    private let key = "saveQuestion"
    
    func saveQuestion(question: [QuestionsStruct]) {
        // MARK: Сделать проверку на наличие вопроса в существующем массиве
//        QuestionsStorage.shared.questions.forEach { $0.question == question }
        do {
            let data: Memento = try encoder.encode(question)
            UserDefaults.standard.setValue(data, forKey: key)
            QuestionsStorage.shared.addQuestion(question: Game.shared.customQuestions)
            print(QuestionsStorage.shared.questions)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadQuestions() -> [QuestionsStruct] {
        guard let data: Memento = UserDefaults.standard.data(forKey: key) else { return [] }
        do {
            return try decoder.decode([QuestionsStruct].self, from: data)
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
