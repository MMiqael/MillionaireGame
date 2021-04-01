//
//  SettingsConfigCaretaker.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Микаэл Мартиросян on 29.03.2021.
//

import Foundation

final class SettingsConfigCaretaker {
    
    private let key = "modeKey"
    
    func saveConfig(with mode: Int) {
        UserDefaults.standard.setValue(mode, forKey: key)
    }
    
    func loadConfig() -> Int {
        return UserDefaults.standard.integer(forKey: key)
    }
    
}
