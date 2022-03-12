//
//  WeatherData.swift
//  WeatherUIKit
//
//  Created by iYezan on 11/03/2022.
//

import Foundation

struct WeatherData: Codable {
    let current: Current
}

struct Current: Codable {
    let temp: Double
    let wind_speed: Double
    let humidity: Double
    let weather: [Weather]
}

struct Weather: Codable {
    let main: String
    let id: Int
}

struct Temp: Codable {
    let day: Double
    let night: Double
}
