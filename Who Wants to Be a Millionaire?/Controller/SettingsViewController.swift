//
//  SettingsViewController.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Микаэл Мартиросян on 29.03.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    lazy var settingsView = self.view as! SettingsView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsView.settingsViewDelegate = self
        settingsView.modeSCOutlet.selectedSegmentIndex = Game.shared.chosenMode
    }
}

extension SettingsViewController: SettingsViewDelegate {
    func chooseMode(with index: Int) {
        Game.shared.changeModeStatus(index: index)
    }
}
