//
//  QuestionsStruct.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Микаэл Мартиросян on 20.03.2021.
//

import Foundation

struct QuestionsStruct: Codable {
    var question: String
    var answers: [String]
    var correctAnswer: String
}
