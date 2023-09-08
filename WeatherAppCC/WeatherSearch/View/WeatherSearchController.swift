//
//  WeatherSearchController.swift
//  WeatherAppCC
//
//  Created by Ragha Sindhura Kurella Venkata Subba on 9/7/23.
//

import UIKit
class WeatherSearchController: UIViewController {
    
    let weatherSearchViewModel = WeatherSearchViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
}

extension WeatherSearchController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        guard let text = searchBar.text,
              text != "" else { return }
        
        weatherSearchViewModel.getWeatherDetails(with: text) { refreshWeather in
            guard refreshWeather else {
                //showAlert()
                return
            }
            //configure()
        }
    }
}
    
