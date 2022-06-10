//
//  mainView.swift
//  Weather
//
//  Created by Michael Dvořák on 10/06/2022.
//

import UIKit

class mainView: UIView {
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        constrain()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    var nameLabel = UILabel()
    var cityLabel = UILabel()
    var daysLabel = UILabel()
    var cityPicker = UIPickerView()
    var daysInput = UITextField()
    var resultsTable = UITableView()
    
    
    
    func configure() {
        backgroundColor = UIColor(patternImage: UIImage(named: "back")!)
        
        
        //Weather Label
        nameLabel.text = "WEATHER"
        nameLabel.font = .systemFont(ofSize: 50.0, weight: .semibold)
        nameLabel.textColor = .white
        nameLabel.textAlignment = .center
        
        
        //City Label
        cityLabel.text = "City: "
        cityLabel.font = .systemFont(ofSize: 25.0, weight: .medium)
        cityLabel.textColor = .white
        cityLabel.textAlignment = .center
        
        
        //City Picker
        
        cityPicker.setValue(UIColor.white, forKey: "textColor")
        
        //Days Label
        daysLabel.text = "Days: "
        daysLabel.font = .systemFont(ofSize: 25.0, weight: .medium)
        daysLabel.textColor = .white
        daysLabel.textAlignment = .center
        
        
        //Days TextField
        
        daysInput.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 0.3521243579)
        daysInput.borderStyle = .roundedRect
        daysInput.placeholder = "1-16"
        daysInput.textAlignment = .center
        daysInput.textColor = .white
        
        
        //Weather TableView
        resultsTable.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        resultsTable.backgroundColor = .none
        
    }
    
    
    func constrain() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(cityLabel)
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(cityPicker)
        cityPicker.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(daysLabel)
        daysLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(daysInput)
        daysInput.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(resultsTable)
        resultsTable.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate(
            [
                nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60),
                nameLabel.widthAnchor.constraint(equalToConstant: 250),
                nameLabel.heightAnchor.constraint(equalToConstant: 50),
                
                
                cityLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
                cityLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 80),
                cityLabel.widthAnchor.constraint(equalToConstant: 60),
                cityLabel.heightAnchor.constraint(equalToConstant: 50),
                
                
                cityPicker.centerXAnchor.constraint(equalTo: centerXAnchor),
                cityPicker.topAnchor.constraint(equalTo: cityLabel.topAnchor, constant: 50),
                cityPicker.widthAnchor.constraint(equalToConstant: 300),
                cityPicker.heightAnchor.constraint(equalToConstant: 80),
                
                
                daysLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
                daysLabel.topAnchor.constraint(equalTo: cityPicker.topAnchor, constant: 60),
                daysLabel.widthAnchor.constraint(equalToConstant: 70),
                daysLabel.heightAnchor.constraint(equalToConstant: 50),
                
                
                daysInput.centerXAnchor.constraint(equalTo: centerXAnchor),
                daysInput.topAnchor.constraint(equalTo: daysLabel.topAnchor, constant: 50),
                daysInput.widthAnchor.constraint(equalToConstant: 50),
                daysInput.heightAnchor.constraint(equalToConstant: 50),
                
                
                resultsTable.centerXAnchor.constraint(equalTo: centerXAnchor),
                resultsTable.topAnchor.constraint(equalTo: daysInput.topAnchor, constant: 80),
                resultsTable.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
                resultsTable.widthAnchor.constraint(equalToConstant: 350)
            ])
    }
    
}
