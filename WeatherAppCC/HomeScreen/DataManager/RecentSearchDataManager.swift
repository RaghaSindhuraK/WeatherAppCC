//
//  RecentSearchDataManager.swift
//  WeatherAppCC
//
//  Created by Ragha Sindhura Kurella Venkata Subba on 9/8/23.
//

import Foundation

class RecentSearchDataManager {
    func getRecentSearch() -> [WeatherSearchDataModel] {
    
        guard let recentHistory = UserDefaults.standard.data(forKey: recentSearches) else {
            return [WeatherSearchDataModel]()
        }
        
        do {
            let decoder = JSONDecoder()
            let list = try decoder.decode([WeatherSearchDataModel].self, from: recentHistory)
            return list
        } catch {}
        
        return [WeatherSearchDataModel]()
    }
}
