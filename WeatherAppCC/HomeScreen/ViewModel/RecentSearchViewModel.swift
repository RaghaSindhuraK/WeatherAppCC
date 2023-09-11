//
//  RecentSearchViewModel.swift
//  WeatherAppCC
//
//  Created by Ragha Sindhura Kurella Venkata Subba on 9/8/23.
//

import Foundation

class RecentSearchViewModel {
    // Model
    private var savedHistory = [WeatherSearchDataModel]()
    // Data manager
    private var recentSearchDataManager = RecentSearchDataManager()
    
    // Convert Kelvin to Farhenheit
    private func convertunits(value: Double) -> Int {
        Int(((value - 273.15) * 9/5) + 32)
    }
    
    // Total number of locations searched
    var rows: Int {
        savedHistory.count
    }
    
    convenience init(with datamanager: RecentSearchDataManager) {
        self.init()
        recentSearchDataManager = datamanager
    }
    
    // Cell label text
    func cityName(at index: Int) -> String {
        guard index >= 0,
              index < savedHistory.count else { return "" }
        
        let model = savedHistory[index]
        
        let value = convertunits(value: model.main.temp)
        return "\(model.name) (\(value)) Fahrenheit"
    }

    // Get recent search from user defaults
    func getHistory() {
        savedHistory = recentSearchDataManager.getRecentSearch()
    }
}
