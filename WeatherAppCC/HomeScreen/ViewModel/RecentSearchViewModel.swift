//
//  RecentSearchViewModel.swift
//  WeatherAppCC
//
//  Created by Ragha Sindhura Kurella Venkata Subba on 9/8/23.
//

import Foundation

class RecentSearchViewModel {
    private var savedHistory = [WeatherSearchDataModel]()
    private var recentSearchDataManager = RecentSearchDataManager()
    
    private func convertunits(value: Double) -> Int {
        Int(((value - 273.15) * 9/5) + 32)
    }
    
    var rows: Int {
        savedHistory.count
    }
    
    convenience init(with datamanager: RecentSearchDataManager) {
        self.init()
        recentSearchDataManager = datamanager
    }
    
    func cityName(at index: Int) -> String {
        guard index < savedHistory.count else { return "" }
        
        let model = savedHistory[index]
        
        let value = convertunits(value: model.main.temp)
        return "\(model.name) (\(value)) Fahrenheit"
    }

    func getHistory() {
        savedHistory = recentSearchDataManager.getRecentSearch()
    }
}
