//
//  WeatherManager.swift
//  WeatherUIKit
//
//  Created by iYezan on 11/03/2022.
//

import Foundation
import CoreLocation

struct NetworkManager {
    private let oneCallApi = "https://api.openweathermap.org/data/2.5/onecall?&appid=7f447e6beb33aa9ea029a038227de6c9&units=metric"
    private let reverseApi = "https://api.openweathermap.org/geo/1.0/reverse?appid=7f447e6beb33aa9ea029a038227de6c9"
    private let geocodeApi = "https://api.openweathermap.org/geo/1.0/direct?appid=7f447e6beb33aa9ea029a038227de6c9"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchGeocode(cityName:String) {
        let urlString = "\(geocodeApi)&q=\(cityName)" 
            performRequest(urlString: urlString, isFetchWeather: false)
    }
    
    func fetchGeocode(lat:CLLocationDegrees, lon:CLLocationDegrees) {
        let urlString = "\(reverseApi)&lat=\(lat)&lon=\(lon)"
        performRequest(urlString: urlString, isFetchWeather: false)
    }
    
    func fetchWeather(lat:CLLocationDegrees, lon:CLLocationDegrees) {
        let urlString = "\(oneCallApi)&lat=\(lat)&lon=\(lon)"
        performRequest(urlString: urlString, isFetchWeather: true)
    }
    
    private func performRequest(urlString:String, isFetchWeather:Bool) {
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if let err = error{
                    print(err.localizedDescription)
                   delegate?.didFailWithError(error: "Network Error")
                }
                if let safeData = data{
                    if isFetchWeather{
                        if let weather = parsedWeatherJson(weatherData: safeData){
                            delegate?.didUpdateWeather(self, weather: weather)
                        }
                    } else{
                        if let geocode = parsedGeocodeJson(geocodeData: safeData){
                            delegate?.didUpdateGeocode(self, geocode: geocode)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
