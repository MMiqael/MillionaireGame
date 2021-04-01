//
//  ResultsCaretaker.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Микаэл Мартиросян on 29.03.2021.
//

import Foundation

typealias Memento = Data

final class ResultsCaretaker {
    
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    private let key = "com.miqaelmartirosyan.Who-Wants-to-Be-a-Millionaire-"
    
    func saveResult(results: [ResultStruct]) {
        do {
            let data: Memento = try encoder.encode(results)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadData() -> [ResultStruct] {
        guard let data: Memento = UserDefaults.standard.data(forKey: key) else { return [] }
        
        do {
            return try decoder.decode([ResultStruct].self, from: data)
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
