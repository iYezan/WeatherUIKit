//
//  Ext+ViewController.swift
//  WeatherUIKit
//
//  Created by iYezan on 11/03/2022.
//

import UIKit

extension ViewController {
    
    func configureTextField() {
        view.addSubview(searchTextField)
        searchTextField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            searchTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configureTodayLabel() {
        view.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        dateLabel.text     = "Today, 10 Mar"
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 10),
            dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dateLabel.heightAnchor.constraint(equalToConstant: 50),
            dateLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func configureCityLabel() {
        view.addSubview(cityLabel)
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        cityLabel.text     = "London"
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10),
            cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cityLabel.heightAnchor.constraint(equalToConstant: 10),
            cityLabel.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    func configureButton() {
        view.addSubview(searchButon)
        searchButon.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchButon.widthAnchor.constraint(equalToConstant: 35),
            searchButon.heightAnchor.constraint(equalToConstant: 35),
            searchButon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchButon.centerYAnchor.constraint(equalTo:self.searchTextField.centerYAnchor)
        ])
    }

    func configureIconImage() {
        view.addSubview(iconImage)
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 80),
            iconImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconImage.heightAnchor.constraint(equalToConstant: 150),
            iconImage.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func configureWeatherLabel() {
        view.addSubview(weatherLabel)
        weatherLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            weatherLabel.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 40),
            weatherLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherLabel.heightAnchor.constraint(equalToConstant: 10),
            weatherLabel.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    func configureTemperatureLabel() {
        view.addSubview(temperatureLabel)
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        
        temperatureLabel.text     = "12"
        NSLayoutConstraint.activate([
            temperatureLabel.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 30),
            temperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            temperatureLabel.heightAnchor.constraint(equalToConstant: 50),
            temperatureLabel.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
}
