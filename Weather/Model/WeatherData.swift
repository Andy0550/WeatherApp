//
//  WeatherData.swift
//  Weather
//
//  Created by Michael Dvořák on 06/06/2022.
//

import Foundation

struct WeatherData: Decodable {
    let cnt: Int
    let list: [List]
}

struct List: Decodable {
    let dt: Int
    let temp: Temp
    let weather: [Weather]
}

struct Temp: Decodable {
    let day: Double
}

struct Weather: Decodable {
    let icon: String
}


