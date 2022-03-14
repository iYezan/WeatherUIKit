//
//  ViewController.swift
//  WeatherUIKit
//
//  Created by iYezan on 10/03/2022.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    let dateLabel           = WBodyLabel(textAlignment: .center, fontSize: 18)
    let cityLabel           = WTitleLabel(textAlignment: .center, fontSize: 16)
    let weatherLabel        = WTitleLabel(textAlignment: .center, fontSize: 16)
    let temperatureLabel    = WBodyLabel(textAlignment: .center, fontSize: 58)
    
    let searchTextField     = WFTextField()
    let iconImage           = UIImageView()
    let searchButon         = WSearchButton()

    private let locationManager = CLLocationManager()
    private var weatherManager = NetworkManager()
    private var weather: WeatherModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.attributedPlaceholder = NSAttributedString(string: "Search...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(white: 1, alpha: 0.7)])
        
        // Do any additional setup after loading the view.
        view.backgroundColor    = .systemBackground
        configureTextField()
        configureTodayLabel()
        configureCityLabel()
        configureIconImage()
        configureButton()
        configureWeatherLabel()
        configureTemperatureLabel()

        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(self.dismissKeyboard))
        searchTextField.delegate = self
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
       
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        weatherManager.delegate = self
        
        getCurrentDateTime()
    }
    
    func getCurrentDateTime() {
        
        let currentDateTime = Date()
        let formatter = DateFormatter()
        let formatter2 = DateFormatter()
        formatter.dateFormat = "dd MMM"
        formatter2.dateFormat = "HH"
        let dateString = formatter.string(from: currentDateTime)
        cityLabel.text = "Today, \(dateString)"
    }
    
    @objc func dismissKeyboard() {
        searchTextField.text = ""
        searchTextField.resignFirstResponder()
    }
}

extension ViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text{
            if text != ""{
                weatherManager.fetchGeocode(cityName: text)
                textField.text = ""
            }
        }
    }
}

extension ViewController: WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: NetworkManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = "\(weather.current.temperatureString)°"
            self.iconImage.image = UIImage(named: weather.getWeatherIcon(id: weather.current.conditionId))
            self.weatherLabel.text = weather.current.desc
            self.weather = weather
        }
    }
    
    func didUpdateGeocode(_ weatherManager: NetworkManager, geocode: GeocodeData) {
        DispatchQueue.main.async {
            self.cityLabel.text = geocode.name
            weatherManager.fetchWeather(lat: geocode.lat, lon: geocode.lon)
        }
    }
    
    func didFailWithError(error: String) {
        print(error)
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchGeocode(lat: lat, lon: lon)
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}





