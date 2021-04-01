//
//  SettingsView.swift
//  Who Wants to Be a Millionaire?
//
//  Created by Микаэл Мартиросян on 29.03.2021.
//

import UIKit

protocol SettingsViewDelegate: class {
    func chooseMode(with index: Int)
}

class SettingsView: UIView {
    
    weak var settingsViewDelegate: SettingsViewDelegate?
    
    private var selectedMode: GameMode {
        GameMode(rawValue: modeSCOutlet.selectedSegmentIndex) ?? .sequentially
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var modeLabel: UILabel!
    
    @IBOutlet weak var modeSCOutlet: UISegmentedControl!
    
    @IBAction func modeSCAction(_ sender: UISegmentedControl) {
        settingsViewDelegate?.chooseMode(with: selectedMode.rawValue)
    }
}
