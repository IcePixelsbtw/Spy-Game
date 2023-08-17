//
//  TableViewCell.swift
//  Spy Game
//
//  Created by Anton on 17.08.2023.
//
import Foundation
import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    static let identifier = "SettingsTableViewCell"

    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
       //imageView.layer.cornerRadius = 35
        imageView.layer.masksToBounds = true
        imageView.tintColor = .black
        
        return imageView
    }()
    
    private let settingLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 21, weight: .semibold)
        
        return label
    }()
    
    private let currentValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 21, weight: .bold)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(iconImageView)
        contentView.addSubview(settingLabel)
        contentView.addSubview(currentValueLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        iconImageView.frame = CGRect(x: 25,
                                     y: 10,
                                     width: 25,
                                     height: 25)
        settingLabel.frame = CGRect(x: iconImageView.right + 15,
                                    y: 10,
                                    width: contentView.width - 150 - iconImageView.width,
                                    height: 30)
        currentValueLabel.frame = CGRect(x: 350,
                                         y: 10,
                                         width: 50,
                                         height: 30)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: SettingRow) {
     
        settingLabel.text = model.label
        currentValueLabel.text = model.currentValue
        iconImageView.image = UIImage(systemName: "\(model.iconName)")
        
    }
}
