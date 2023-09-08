//
//  WeatherSearchDataManager.swift
//  WeatherAppCC
//
//  Created by Ragha Sindhura Kurella Venkata Subba on 9/7/23.
//

import Foundation

class WeatherSearchDataManager: NSObject {
    private let searchURL = "https://api.openweathermap.org/data/2.5/weather?q=%@&appid=%@"
    
    func getWeatherDetails(with cityName: String, callback: @escaping (WeatherSearchDataModel?) -> Void) {
        
        guard let url = URL(string: String(format: searchURL, cityName, apiKey)) else { return }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, urlResponse, error in
            DispatchQueue.main.async {
                guard let responseData = data,
                      error == nil else {
                    callback(nil)
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let weatherData = try decoder.decode(WeatherSearchDataModel.self, from: responseData)
                    callback(weatherData)
                } catch {}
            }
        }.resume()
    }
    
}
