//
//  MainViewController.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Микаэл Мартиросян on 20.03.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var settings: UIButton!
    @IBOutlet weak var addQuestion: UIButton!
    @IBOutlet weak var startGame: UIButton!
    @IBOutlet weak var results: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConfig()
        QuestionsStorage.shared.addQuestion(question: Game.shared.customQuestions)
    }
    
    @IBAction func addQuestion(_ sender: UIButton) {
        performSegue(withIdentifier: SegueIdentifiers.addQuestion.rawValue, sender: self)
    }
    
    @IBAction func settings(_ sender: UIButton) {
        performSegue(withIdentifier: SegueIdentifiers.settingsSegue.rawValue, sender: self)
    }
    
    @IBAction func startGame(_ sender: UIButton) {
        let gameSession = GameSession(questionsCount: QuestionsStorage.shared.questions.count)
        Game.shared.gameSession = gameSession
        performSegue(withIdentifier: SegueIdentifiers.startGameSegue.rawValue, sender: self)
    }
    
    @IBAction func results(_ sender: UIButton) {
        performSegue(withIdentifier: SegueIdentifiers.resultsSegue.rawValue, sender: self)
    }
    
    func setupConfig() {
        settings.setTitle("⚙️", for: .normal)
        settings.backgroundColor = .clear
        
        addQuestion.setTitle("⊕", for: .normal)
        addQuestion.titleLabel?.tintColor = .systemGreen
        addQuestion.backgroundColor = .clear
        
        startGame.layer.cornerRadius = 10
    }
}
