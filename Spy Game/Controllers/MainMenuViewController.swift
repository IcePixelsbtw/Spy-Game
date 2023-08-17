//
//  ViewController.swift
//  Spy Game
//
//  Created by Anton on 17.08.2023.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.clipsToBounds = true
        
        return scrollView
    }()
    
    private let playButton: UIButton = {
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        button.layer.borderColor = CGColor(red: 128, green: 128, blue: 128, alpha: 1)
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        
        return button
    }()
    
    private let settingsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Settings", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        button.layer.borderColor = CGColor(red: 128, green: 128, blue: 128, alpha: 1)
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Main"
        
        view.addSubview(scrollView)
        scrollView.addSubview(playButton)
        scrollView.addSubview(settingsButton)
        
        
        settingsButton.addTarget(self,
                                 action: #selector(didTapSettings),
                                 for: .touchUpInside)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapSettings))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.bounds
        let _ = scrollView.width / 3
        playButton.frame = CGRect(x: 30,
                                  y: 340,
                                  width: scrollView.width - 60,
                                  height: 52)
        settingsButton.frame = CGRect(x: 30,
                                      y: playButton.bottom + 30,
                                      width: scrollView.width - 60,
                                      height: 52)
    }
    
    
    @objc private func didTapSettings() {
        print("didTapSettings")

        let rootVC = SettingsViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
    
    
}

