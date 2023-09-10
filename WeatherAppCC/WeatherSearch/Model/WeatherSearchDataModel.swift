//
//  WeatherSearchDataModel.swift
//  WeatherAppCC
//
//  Created by Ragha Sindhura Kurella Venkata Subba on 9/7/23.
//

import Foundation

struct WeatherCoordModel: Codable {
    var lon: Double
    var lat: Double
}

struct WeatherCondition: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

struct WeatherTemperature: Codable {
    var temp: Double
    var feels_like: Double
    var temp_min: Double
    var temp_max: Double
    var pressure: Int
    var humidity: Int
}

struct WeatherWindModel: Codable {
    var speed: Double
    var deg: Int
    var gust: Double
}

struct WeatherCloudModel: Codable {
    var all: Int
}

struct WeatherSystemDetails: Codable {
    var type: Int
    var id: Int
    var country: String
    var sunrise: Int
    var sunset: Int
}

struct WeatherSearchDataModel: Codable {
    var coord: WeatherCoordModel
    var weather: [WeatherCondition]
    var base: String
    var main: WeatherTemperature
    var visibility: Int
    var clouds: WeatherCloudModel
    var dt: UInt
    var sys: WeatherSystemDetails
    var timezone: Int
    var id: Int
    var name: String
    var cod: Int
}
