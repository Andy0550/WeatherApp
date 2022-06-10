//
//  Weather Manager.swift
//  Weather
//
//  Created by Michael Dvořák on 06/06/2022.
//

import Foundation

protocol WeatherManagerDelegate {
    func didFailWithError(error: Error)
    func didUpdateWeather(weatherArr: [WeatherModel])
}


struct WeatherManager {
    
    let weatherURL =
        "https://api.openweathermap.org/data/2.5/forecast/daily?appid=33aa634c216259f797f35e862f073b40&units=metric"
    
    func fetchWeather(town: City, days: Int) {
        let urlString = "\(weatherURL)&lat=\(town.lat)&lon=\(town.lon)&cnt=\(days)"
        performRequest(with: urlString)
    }
    
    var delegate: WeatherManagerDelegate?
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(weatherArr: weather)
                        
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ wData: Data) -> [WeatherModel]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: wData)
            var dataArray = [WeatherModel]()
            for x in 0..<decodedData.cnt {
                let date = convertDate(unixStamp: decodedData.list[x].dt)
                let temp = String(format: "%.0f",decodedData.list[x].temp.day)
                let icon = decodedData.list[x].weather[0].icon
                
                let weather = WeatherModel(day: date, temperature: temp, iconName: icon)
                dataArray.append(weather)
            }
            return dataArray
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    func convertDate(unixStamp: Int) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "E dd.MM."
        return dateFormat.string(from: Date(timeIntervalSince1970: TimeInterval(unixStamp)))
    }
    
    

    
}
