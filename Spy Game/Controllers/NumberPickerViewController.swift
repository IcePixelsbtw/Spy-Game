//
//  NumberPickerViewController.swift
//  Spy Game
//
//  Created by Anton on 18.08.2023.
//

import UIKit

class NumberPickerViewController: UIViewController {
    
    var keyForValue: KeysForUserDefaults
    
    let numbers: [Int]
    
    private var pickerView: UIPickerView = {
        let picker = UIPickerView()
         
        
        return picker
    }()
    
    init(keyForValue: KeysForUserDefaults) {
        self.keyForValue = keyForValue
        let playerCount = Int(UserDefaults.standard.value(forKey: KeysForUserDefaults.playersCount.rawValue) as! String) ?? 0

        switch keyForValue {
        case .playersCount:
            numbers = Array(3...20)
        case .spyCount:
            if playerCount <= 5 {
                numbers = Array(1...2)
            } else if playerCount > 5 && playerCount <= 10 {
                numbers = Array(1...3)
            }
            else if playerCount > 10 && playerCount <= 15 {
                numbers = Array(1...7)
            }
            else if playerCount > 15 && playerCount <= 20 {
                numbers = Array(1...10)
            }

            else {
                numbers = Array(1...2)
            }
        case .timerMinutes:
            numbers = Array(1...30)

        }
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.backgroundColor = .white
        view.addSubview(pickerView)
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        pickerView.frame = CGRect(x: 0,
                                  y: 0,
                                  width: view.width,
                                  height: view.height)
        pickerView.clipsToBounds = true
    }
}


extension NumberPickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numbers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(numbers[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Set a userdefaults value: \(numbers[row]) for key: \(keyForValue) with type: \(type(of: numbers[row]))")
        UserDefaults.standard.set("\(numbers[row])", forKey: "\(keyForValue)")
        let playerCount = Int(UserDefaults.standard.value(forKey: KeysForUserDefaults.playersCount.rawValue) as! String) ?? 0
        let spyCount = Int(UserDefaults.standard.value(forKey: KeysForUserDefaults.spyCount.rawValue) as! String) ?? 0
        
        if playerCount < spyCount {
            
            if keyForValue == .playersCount {
                if numbers[row] <= 5 {
                    UserDefaults.standard.set("1", forKey: "\(KeysForUserDefaults.spyCount)")
                    
                } else if playerCount > 5 && playerCount <= 10 {
                    UserDefaults.standard.set("2", forKey: "\(KeysForUserDefaults.spyCount)")
                }
                else if playerCount > 10 && playerCount <= 15 {
                    UserDefaults.standard.set("3", forKey: "\(KeysForUserDefaults.spyCount)")
                    
                }
                else if playerCount > 15 && playerCount <= 20 {
                    UserDefaults.standard.set("4", forKey: "\(KeysForUserDefaults.spyCount)")
                    
                }
            }
        }
        print(numbers[row])
    }
}
    
/*
 
 spyCount = 5
 playerCount = 5
 spyCount = 2
 
 spyCount = 7
 playerCount = 5
 spyCoun
 
 
 
 */
