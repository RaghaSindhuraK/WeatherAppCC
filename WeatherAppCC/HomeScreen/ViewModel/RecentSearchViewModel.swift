//
//  RecentSearchViewModel.swift
//  WeatherAppCC
//
//  Created by Ragha Sindhura Kurella Venkata Subba on 9/8/23.
//

import Foundation

class RecentSearchViewModel {
    private var savedHistory = [WeatherSearchDataModel]()
    
    var rows: Int {
        savedHistory.count
    }
    
    func cityName(at index: Int) -> String {
        guard index < savedHistory.count else { return "" }
        
        let model = savedHistory[index]
        return model.name
    }
    
    func getHistory() {
        savedHistory = RecentSearchDataManager().getRecentSearch()
    }
}
