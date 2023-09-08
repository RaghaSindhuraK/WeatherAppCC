//
//  WeatherSearchDataManager.swift
//  WeatherAppCC
//
//  Created by Ragha Sindhura Kurella Venkata Subba on 9/7/23.
//

import Foundation

class WeatherSearchDataManager: NSObject {
    private let searchURL = "https://api.openweathermap.org/data/2.5/weather?q=%@&appid=%@"
    
    func getWeatherDetails(with cityName: String) {
        
        guard let url = URL(string: String(format: searchURL, cityName, apiKey)) else { return }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, urlResponse, error in
            print(data as Any)
        }.resume()
    }
    
}
