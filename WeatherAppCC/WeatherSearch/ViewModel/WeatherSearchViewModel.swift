//
//  WeatherSearchViewModel.swift
//  WeatherAppCC
//
//  Created by Ragha Sindhura Kurella Venkata Subba on 9/7/23.
//

import Foundation

class WeatherSearchViewModel: NSObject {
    // Model for weather data
    private var weatherSearchDataModel: WeatherSearchDataModel?
    // Data manager
    private var weatherSearchDataManager = WeatherSearchDataManager()
    
    // Kelvin to Farhenheit conversion
    private func convertunits(value: Double) -> Int {
        Int(((value - 273.15) * 9/5) + 32)
    }
    
    // Model object for Weather UI
    var cityName: String? {
        weatherSearchDataModel?.name
    }
    var temperatureLabel: String? {
        let value = convertunits(value: weatherSearchDataModel?.main.temp ?? 0.0)
        return "\(value)"
    }
    var weatherCondition: String? {
        "\(weatherSearchDataModel?.weather.first?.main ?? "")"
    }
    var maxTemperature: String? {
        let value = convertunits(value: weatherSearchDataModel?.main.temp_max ?? 0.0)
        return "H: \(value)"
    }
    var minTemperature: String? {
        let value = convertunits(value: weatherSearchDataModel?.main.temp_min ?? 0.0)
        return "L: \(value)"
    }
    var imageUrl: String {
        let urlString = "https://openweathermap.org/img/wn/%@@2x.png"
        guard let imagename = weatherSearchDataModel?.weather.first?.icon else { return "" }
        return String(format: urlString, imagename)
    }
    
    convenience init(with datamanager: WeatherSearchDataManager) {
        self.init()
        weatherSearchDataManager = datamanager
    }
    
    // Fetch weather data by city name
    func getWeatherDetails(with cityName: String, callback: @escaping (Bool) -> Void) {
        weatherSearchDataManager.getWeatherDetails(with: cityName) { [weak self] model in
            self?.weatherSearchDataModel = model
            callback(model != nil)
        }
    }
    
    // Fetch weather data for current location
    func getWeatherForCurrentLocation(callback: @escaping (Bool) -> Void) {
        weatherSearchDataManager.getWeatherForCurrentLocation { [weak self] model in
            self?.weatherSearchDataModel = model
            callback(model != nil)
        }
    }
}
