//
//  MainViewController.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Микаэл Мартиросян on 20.03.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    private let startGameSegue = "startGameSegue"
    private let resultsSegue = "resultsSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func startGame(_ sender: Any) {
        performSegue(withIdentifier: startGameSegue, sender: self)
        let gameSession = GameSession()
        Game.shared.gameSession = gameSession
    }
    
    @IBAction func results(_ sender: Any) {
        performSegue(withIdentifier: resultsSegue, sender: self)
    }
}
