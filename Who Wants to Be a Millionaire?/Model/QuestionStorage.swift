//
//  Questions.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Микаэл Мартиросян on 21.03.2021.
//

import Foundation

enum QuestionStorage {
    static var questions: [QuestionsStruct] = [QuestionsStruct(question: "При каком императоре было отменено крепостное право в России?",
                                                               answers: ["Александр III",  "Петр I", "Николай I", "Александр II"],
                                                               correctAnswer: "Александр II"),
                                               QuestionsStruct(question: "Какая страна не граничит с Россией?",
                                                               answers: ["Северная Корея", "Польша", "Германия", "США"],
                                                               correctAnswer: "Германия"),
                                               QuestionsStruct(question: "Какого цвета волк?",
                                                               answers: ["Серого", "Голубого", "Зеленого", "Желтого"],
                                                               correctAnswer: "Серого"),
                                               QuestionsStruct(question: "Как умер Пушкин?",
                                                               answers: ["От простуды", "В дуэли", "От отравления", "От смеха"],
                                                               correctAnswer: "В дуэли"),
                                               QuestionsStruct(question: "Как называется спутник Земли?",
                                                               answers: ["Астероид", "Солнце", "Нептун", "Луна"],
                                                               correctAnswer: "Луна")
    ]
}
