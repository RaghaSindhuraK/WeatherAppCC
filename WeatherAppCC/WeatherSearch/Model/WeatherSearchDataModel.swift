//
//  WeatherSearchDataModel.swift
//  WeatherAppCC
//
//  Created by Ragha Sindhura Kurella Venkata Subba on 9/7/23.
//

import Foundation

struct WeatherCoordModel: Decodable {
    var lon: Double
    var lat: Double
}

struct WeatherCondition: Decodable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

struct WeatherTemperature: Decodable {
    var temp: Double
    var feels_like: Double
    var temp_min: Double
    var temp_max: Double
    var pressure: Int
    var humidity: Int
}

struct WeatherWindModel: Decodable {
    var speed: Double
    var deg: Int
    var gust: Double
}

struct WeatherCloudModel: Decodable {
    var all: Int
}

struct WeatherSystemDetails: Decodable {
    var type: Int
    var id: Int
    var country: String
    var sunrise: Int
    var sunset: Int
}

struct WeatherSearchDataModel: Decodable {
    var coord: WeatherCoordModel
    var weather: [WeatherCondition]
    var base: String
    var main: WeatherTemperature
    var visibility: Int
    //var wind: WeatherWindModel
    var clouds: WeatherCloudModel
    var dt: UInt
    var sys: WeatherSystemDetails
    var timezone: Int
    var id: Int
    var name: String
    var cod: Int
}
