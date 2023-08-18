//
//  NumberPickerViewController.swift
//  Spy Game
//
//  Created by Anton on 18.08.2023.
//

import UIKit

class NumberPickerViewController: UIViewController {
    
    var keyForValue: KeysForUserDefaults
    
    let numbers: [Int] = Array(1...20)
    
    private var pickerView: UIPickerView = {
        let picker = UIPickerView()
         
        
        return picker
    }()
    
    init(keyForValue: KeysForUserDefaults) {
        self.keyForValue = keyForValue
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
        print(numbers[row])
    }
    
    
}
