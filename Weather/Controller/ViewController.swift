//
//  ViewController.swift
//  Weather
//
//  Created by Michael Dvořák on 05/06/2022.
//

import UIKit

class ViewController: UIViewController, WeatherManagerDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    var mainV = mainView()
    
    let city = [City.init(name: "České Budějovice", lat: "48.97378881915517", lon: "14.476120512906416"), City.init(name: "New York", lat: "40.79052384606425", lon: "-73.95908688800822"), City.init(name: "Sydney", lat: "-33.8470241774331", lon: "151.0624326592654")]
    
    var daysCount = "5"
    var pickedCity: City = City(name: "", lat: "", lon: "")
    
    var weatherManager = WeatherManager()
    
    var weatherArray: [WeatherModel] = []
    
    func numberOfComponents(in cityPicker: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ cityPicker: UIPickerView, numberOfRowsInComponent: Int) -> Int {
        return city.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if weatherArray.count != 0 {
            return weatherArray.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        if weatherArray.count != 0 {
            let w = weatherArray[indexPath.item]
            
            cell.configure(weather: w)
        }
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    func didUpdateWeather(weatherArr: [WeatherModel]) {
        weatherArray = weatherArr
        DispatchQueue.main.async {
            self.mainV.resultsTable.reloadData()
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        pickedCity = city[row]
        return city[row].name
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.mainV.daysInput.endEditing(true)
        if self.mainV.daysInput.text != "" {
            let text = (self.mainV.daysInput.text)!
            if CharacterSet(charactersIn: "0123456789").isSuperset(of: CharacterSet(charactersIn: text)) {
                if Int(text)! < 17 {
                    daysCount = self.mainV.daysInput.text!
                    weatherManager.fetchWeather(town: pickedCity, days: Int(daysCount)!)
                }
            }
        }
        return true
    }
    
    
    func configure() {
        mainV.cityPicker.dataSource = self
        mainV.cityPicker.delegate = self
        mainV.resultsTable.dataSource = self
        mainV.resultsTable.delegate = self
        mainV.daysInput.delegate = self
    }
    
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
    
    ///
    
    lazy var contentView: mainView = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherManager.delegate = self
        view = mainV
        configure()
    }
    
    
    
    
    
    
    
    
    
}

