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
    
    func getWeatherDetails(with cityName: String, callback: @escaping (Bool) -> Void) {
        weatherSearchDataManager.getWeatherDetails(with: cityName) { [weak self] model in
            self?.weatherSearchDataModel = model
            callback(model != nil)
        }
    }
}
