//
//  WeatherModel.swift
//  WeatherUIKit
//
//  Created by iYezan on 11/03/2022.
//

import Foundation

struct WeatherModel{
    let current: CurrentWeather

    func getWeatherIcon(id: Int) -> String {
        
        switch id {
        case 200...232:
            return "thunderstorm"
        case 300...321:
            return "rain"
        case 500...531:
            return "rain"
        case 600...622:
            return "snow"
        case 701...781:
            return "mist"
        case 800:
            return "clear"
        case 801...804:
            return "cloudy"
        default:
            return "cloudy"
        }
    }
}

struct CurrentWeather {
    
    let conditionId: Int
    let temperature: Double
    let desc: String
    
    var temperatureString: String {
        return String(format: "%.0f", temperature)
    }
}
