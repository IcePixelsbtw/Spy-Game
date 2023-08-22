//
//  PlayViewController.swift
//  Spy Game
//
//  Created by Anton on 17.08.2023.
//

import UIKit

class PlayViewController: UIViewController {

    let playerCount = Int(UserDefaults.standard.value(forKey: KeysForUserDefaults.playersCount.rawValue) as! String) ?? 0
    let spyCount = Int(UserDefaults.standard.value(forKey: KeysForUserDefaults.spyCount.rawValue) as! String) ?? 0
    let timerMinutes = Int(UserDefaults.standard.value(forKey: KeysForUserDefaults.timerMinutes.rawValue) as! String) ?? 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done",
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(dismissSelf))
    
    }
 
    
    @objc private func dismissSelf() {
        dismiss(animated: true)
    
    }

}
