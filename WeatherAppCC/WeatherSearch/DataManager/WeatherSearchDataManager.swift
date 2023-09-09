//
//  WeatherSearchDataManager.swift
//  WeatherAppCC
//
//  Created by Ragha Sindhura Kurella Venkata Subba on 9/7/23.
//

import Foundation
import CoreLocation

class WeatherSearchDataManager: NSObject {
    private var locationManager: CLLocationManager?
    
    private let searchURL = "https://api.openweathermap.org/data/2.5/weather?q=%@&appid=%@"
    
    private let lonLatUrl = "https://api.openweathermap.org/data/2.5/weather?lat=%f&lon=%f&appid=%@"
    
    private var currentWeather: ((WeatherSearchDataModel?) -> Void)?
    
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
                    self.storeRecentSearch(model: weatherData)
                    
                    callback(weatherData)
                } catch {}
            }
        }.resume()
    }
    
    
    func getlonlatDetails (with lon: Double, lat: Double, callback: @escaping (WeatherSearchDataModel?) -> Void) {
        
        guard let urlLonLat = URL(string: String(format: lonLatUrl,lat,lon, apiKey)) else { return }
        
        URLSession.shared.dataTask(with: URLRequest(url: urlLonLat)) { data, urlResponse, error in
            DispatchQueue.main.async {
                guard let responseData = data,
                      error == nil else {
                    callback(nil)
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let weatherData = try decoder.decode(WeatherSearchDataModel.self, from: responseData)
                    self.storeRecentSearch(model: weatherData)
                    
                    callback(weatherData)
                } catch {}
            }
        }.resume()
    }
    
    func getWeatherForCurrentLocation(callback: @escaping (WeatherSearchDataModel?) -> Void) {
        currentWeather = callback
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
    }
    private func storeRecentSearch(model: WeatherSearchDataModel) {
        
        guard let recentHistory = UserDefaults.standard.data(forKey: recentSearches) else {
            do {
                let encoder = JSONEncoder()
                let data = try encoder.encode([model])
                UserDefaults.standard.setValue(data, forKey: recentSearches)
            } catch {}
            
            return
        }
        
        do {
            let decoder = JSONDecoder()
            var list = try decoder.decode([WeatherSearchDataModel].self, from: recentHistory)
            list.append(model)
            
            let encoder = JSONEncoder()
            let data = try encoder.encode(list)
            UserDefaults.standard.setValue(data, forKey: recentSearches)
        } catch {}
    }
}

extension WeatherSearchDataManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        manager.stopUpdatingLocation()
        
        guard let latitude = locations.first?.coordinate.latitude,
              let longitude = locations.first?.coordinate.longitude,
              let callback = currentWeather else { return }
        
        getlonlatDetails(with: longitude, lat: latitude, callback: callback)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        manager.stopUpdatingLocation()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways:
            manager.startUpdatingLocation()
        case .authorizedWhenInUse:
            manager.startUpdatingLocation()
        default:
            break
        }
    }
}
