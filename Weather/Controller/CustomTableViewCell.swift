//
//  CustomTableViewCell.swift
//  Weather
//
//  Created by Michael Dvořák on 08/06/2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    static let identifier = "CustomTableViewCell"
    
    let weatherImage: UIImageView = {
        let weatherImage = UIImageView()
       return weatherImage
    }()
    
    let dayLabel: UILabel = {
        let dayLabel = UILabel()
        dayLabel.font = .systemFont(ofSize: 20)
        dayLabel.textColor = .white
       return dayLabel
    }()
    
    let tempLabel: UILabel = {
        let tempLabel = UILabel()
        tempLabel.font = .systemFont(ofSize: 20)
        tempLabel.textColor = .white
       return tempLabel
    }()
    
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.9030795832, alpha: 0.7893835616)
        contentView.addSubview(weatherImage)
        contentView.addSubview(dayLabel)
        contentView.addSubview(tempLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(weather: WeatherModel) {
        dayLabel.text = weather.day
        tempLabel.text = weather.temperature + " C°"
        weatherImage.image = UIImage(named: weather.iconName)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        dayLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        dayLabel.widthAnchor.constraint(equalToConstant: 110).isActive = true
        dayLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        weatherImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        weatherImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        weatherImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        weatherImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        tempLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        tempLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        tempLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
    }
    
}
