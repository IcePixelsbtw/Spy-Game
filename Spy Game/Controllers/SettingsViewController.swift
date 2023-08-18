//
//  SettingsViewController.swift
//  Spy Game
//
//  Created by Anton on 17.08.2023.
//

import UIKit
import Foundation

class SettingsViewController: UIViewController {
    
 //   let data = ["Players", "Spy", "Collection", "Language", "Timer"]
    
     var data = [SettingRow]()
    
        
    private let tableView: UITableView = {
        let table = UITableView()
        
        return table
    }()
    
    //MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(UserDefaults.standard.value(forKey: KeysForUserDefaults.playersCount.rawValue) ?? "Error")
        
        view.backgroundColor = .red
        
        self.tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "<- Back",
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(dismissSelf))
        
        // Add subviews
        view.addSubview(tableView)
        
        
        
        
        
        self.data = [
            
            SettingRow(label: "Players",
                       currentValue: UserDefaults.standard.value(forKey: KeysForUserDefaults.playersCount.rawValue) as? String,
                                                                 iconName: "person.fill",
                                                                 handler: { [weak self] in
            print("Players")
            let vc = NumberPickerViewController(keyForValue: KeysForUserDefaults.playersCount)

            self?.navigationController?.pushViewController(vc, animated: true)
        }),
        
        SettingRow(label: "Spy", currentValue: UserDefaults.standard.value(forKey: KeysForUserDefaults.spyCount.rawValue) as? String, iconName: "shoeprints.fill", handler: { [weak self] in
            print("Spy")
            let vc = NumberPickerViewController(keyForValue: KeysForUserDefaults.spyCount)

            self?.navigationController?.pushViewController(vc, animated: true)
        }),
        
        SettingRow(label: "Collection", currentValue: nil, iconName: "rectangle.stack", handler: {
            print("Collection")
 //TODO: Create collection screen
        }),
        
        SettingRow(label: "Language", currentValue: nil, iconName: "globe", handler: {
            print("Language")
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)

        }),
        
        SettingRow(label: "Timer", currentValue: UserDefaults.standard.value(forKey: KeysForUserDefaults.timerMinutes.rawValue) as? String, iconName: "timer", handler: { [weak self] in
            print("Timer")
            let vc = NumberPickerViewController(keyForValue: KeysForUserDefaults.timerMinutes)
            
            self?.navigationController?.pushViewController(vc, animated: true)
        })
        ]
        
    }
    @objc private func dismissSelf() {
        dismiss(animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds

    }
    
}


extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as! SettingsTableViewCell
        let model = data[indexPath.row]
        cell.configure(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model = data[indexPath.row]
        model.handler()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
}
