//
//  WeatherSearchViewModel.swift
//  WeatherAppCC
//
//  Created by Ragha Sindhura Kurella Venkata Subba on 9/7/23.
//

import Foundation

class WeatherSearchViewModel: NSObject {
    private var weatherSearchDataModel: WeatherSearchDataModel?
    private let weatherSearchDataManager = WeatherSearchDataManager()
    
    private func convertunits(value: Double) -> Int {
        Int(((value - 273.15) * 9/5) + 32)
    }
    
    func getWeatherDetails(with cityName: String, callback: @escaping (Bool) -> Void) {
        weatherSearchDataManager.getWeatherDetails(with: cityName) { [weak self] model in
            self?.weatherSearchDataModel = model
            callback(model != nil)
        }
    }
    
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
}
