//
//  WeatherSearchController.swift
//  WeatherAppCC
//
//  Created by Ragha Sindhura Kurella Venkata Subba on 9/7/23.
//

import UIKit
class WeatherSearchController: UIViewController {
    
    @IBOutlet weak var weatherView: UIStackView!
    
    @IBOutlet weak var cityName: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var weatherCondition: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var maxTemp: UILabel!
    
    @IBOutlet weak var minTemp: UILabel!
    
    @IBAction func fetchLocation(_ sender: Any) {
        getCurrentLocationWeather()
    }
    let weatherSearchViewModel = WeatherSearchViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherView.isHidden = true
        
        getCurrentLocationWeather()
    }
    
    private func getCurrentLocationWeather() {
        weatherSearchViewModel.getWeatherForCurrentLocation { [weak self] refreshWeather in
            guard refreshWeather else {
                self?.handleError()
                return
            }
            self?.configure()
        }
    }
    
    private func configure() {
        cityName.text = weatherSearchViewModel.cityName
        temperatureLabel.text = weatherSearchViewModel.temperatureLabel
        weatherCondition.text = weatherSearchViewModel.weatherCondition
        maxTemp.text = weatherSearchViewModel.maxTemperature
        minTemp.text = weatherSearchViewModel.minTemperature
        weatherView.isHidden = false
    
        imageView.loadImage(with: weatherSearchViewModel.imageUrl)
    }
    
    private func handleError() {
        weatherView.isHidden = true
        
        let alert = UIAlertController(title: "Something went wrong", message: "Please enter a valid city name in US or try again later", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
}

extension WeatherSearchController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        guard let text = searchBar.text,
              text != "" else { return }
        
        weatherSearchViewModel.getWeatherDetails(with: text) { [weak self] refreshWeather in
            guard refreshWeather else {
                self?.handleError()
                return
            }
            self?.configure()
        }
    }
}

extension UIImageView {
    func loadImage(with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        let cache = URLCache.shared
        let request = URLRequest(url: url)
        
        if let data = cache.cachedResponse(for: request)?.data {
            self.image = UIImage(data: data)
        } else {
            URLSession.shared.dataTask(with: request) { data, urlResponse, error in
                DispatchQueue.main.async {
                    guard let responseData = data,
                          let urlresponse = urlResponse,
                          error == nil else {
                        DispatchQueue.main.async {
                            self.image = nil
                        }
                        return
                    }
                    
                    cache.storeCachedResponse(CachedURLResponse(response: urlresponse, data: responseData), for: request)
                    
                    DispatchQueue.main.async {
                        self.image = UIImage(data: responseData)
                    }
                }
            }.resume()
        }
            
        
        
    }
}
    
