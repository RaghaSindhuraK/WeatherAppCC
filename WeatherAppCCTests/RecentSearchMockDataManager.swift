//
//  RecentSearchMockDataManager.swift
//  WeatherAppCCTests
//
//  Created by Ragha Sindhura Kurella Venkata Subba on 9/9/23.
//

import Foundation
@testable import WeatherAppCC

class RecentSearchMockDataManager: RecentSearchDataManager {
    override func getRecentSearch() -> [WeatherSearchDataModel] {
        [WeatherSearchDataModel(
            coord: WeatherCoordModel(lon: -74.006, lat: 40.7143),
            weather: [WeatherCondition(id: 801, main: "Clouds", description: "few clouds", icon: "02n")],
            base: "stations",
            main: WeatherTemperature(temp: 301.19, feels_like: 302.89, temp_min: 297.42, temp_max: 303.12, pressure: 1010, humidity: 62),
            visibility: 10000,
            clouds: WeatherCloudModel(all: 20),
            dt: 1694131437,
            sys: WeatherSystemDetails(type: 1, id: 4610, country: "US", sunrise: 1694082526, sunset: 1694128793),
            timezone:  -14400,
            id: 5128581,
            name: "New York",
            cod: 200
        ),
         WeatherSearchDataModel(
             coord: WeatherCoordModel(lon: -74.006, lat: 40.7143),
             weather: [WeatherCondition(id: 801, main: "Clouds", description: "few clouds", icon: "02n")],
             base: "stations",
             main: WeatherTemperature(temp: 301.19, feels_like: 302.89, temp_min: 297.42, temp_max: 303.12, pressure: 1010, humidity: 62),
             visibility: 10000,
             clouds: WeatherCloudModel(all: 20),
             dt: 1694131437,
             sys: WeatherSystemDetails(type: 1, id: 4610, country: "US", sunrise: 1694082526, sunset: 1694128793),
             timezone:  -14400,
             id: 5128581,
             name: "Dallas",
             cod: 200
         )]
    }
}
