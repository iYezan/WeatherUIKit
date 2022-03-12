//
//  LocationManager.swift
//  WeatherUIKit
//
//  Created by iYezan on 11/03/2022.
//

import UIKit

extension NetworkManager {
    
     func parsedWeatherJson(weatherData:Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.current.weather[0].id
            let desc = decodedData.current.weather[0].main
            let temp = decodedData.current.temp
            let humidity = decodedData.current.humidity
            let wind = decodedData.current.wind_speed
            
            let currentWeather = CurrentWeather(conditionId: id, temperature: temp, desc: desc, wind: wind, humidity: humidity)
    
            let weather = WeatherModel(current: currentWeather)
            
            return weather
            
        } catch{
            print(error.localizedDescription)
            delegate?.didFailWithError(error: "Network Error")
            return nil
        }
    }
    
     func parsedGeocodeJson(geocodeData:Data) -> GeocodeModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode([GeocodeData].self, from: geocodeData)
            if decodedData.isEmpty {
                delegate?.didFailWithError(error: "City Not Found")

                return nil
            } else {
                let name = decodedData.first!.name
                let lat = decodedData.first!.lat
                let lon = decodedData.first!.lon
                let country = decodedData.first!.country
                let geocode = GeocodeModel(name:name, lat: lat, lon: lon, country: country)
                

                return geocode
            }
            
        } catch{
            print(error.localizedDescription)
            delegate?.didFailWithError(error: "Network Error")
            return nil
        }
    }
}
