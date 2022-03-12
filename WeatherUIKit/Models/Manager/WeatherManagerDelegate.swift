//
//  WeatherManagerDelegate.swift
//  WeatherUIKit
//
//  Created by iYezan on 11/03/2022.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: NetworkManager, weather: WeatherModel)
    func didUpdateGeocode(_ weatherManager: NetworkManager, geocode: GeocodeModel)

    func didFailWithError(error: String)
}
