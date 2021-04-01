//
//  GameStrategy.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Микаэл Мартиросян on 30.03.2021.
//

import Foundation

protocol GameStrategy: class {
    func getNewQuestion(view: GameView)
}
