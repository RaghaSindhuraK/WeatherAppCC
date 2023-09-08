//
//  WeatherSearchViewModel.swift
//  WeatherAppCC
//
//  Created by Ragha Sindhura Kurella Venkata Subba on 9/7/23.
//

import Foundation

class WeatherSearchViewModel: NSObject {
    
    let weatherSearchDataManager = WeatherSearchDataManager()
    
    func getWeatherDetails(with cityName: String) {
        weatherSearchDataManager.getWeatherDetails(with: cityName)
    }
}
