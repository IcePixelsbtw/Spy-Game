//
//  NumberPickerViewController.swift
//  Spy Game
//
//  Created by Anton on 18.08.2023.
//

import UIKit

class NumberPickerViewController: UIViewController {
    
    let numbers: [Int] = Array(1...20)
    
    private var pickerView: UIPickerView = {
        let picker = UIPickerView()
         
        
        return picker
    }()
    
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
    
    
}
