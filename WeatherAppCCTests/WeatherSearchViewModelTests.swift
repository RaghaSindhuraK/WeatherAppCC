//
//  WeatherSearchViewModelTests.swift
//  WeatherAppCCTests
//
//  Created by Ragha Sindhura Kurella Venkata Subba on 9/9/23.
//

import XCTest
@testable import WeatherAppCC

final class WeatherSearchViewModelTests: XCTestCase {
    var testViewModel: WeatherSearchViewModel!
    var testDatamanager: WeatherSearchMockDataManager!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        testDatamanager = WeatherSearchMockDataManager()
        testViewModel = WeatherSearchViewModel(with: testDatamanager)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        testDatamanager = nil
        testViewModel = nil
    }
    
    func testWeatherByCityHappyPath() {
        testViewModel.getWeatherDetails(with: "New York") { status in
            if status {
                XCTAssertEqual(self.testViewModel.cityName, "New York", "City name is not correct")
                XCTAssertEqual(self.testViewModel.imageUrl, "https://openweathermap.org/img/wn/02n@2x.png", "ImageUrl is not correct")
                XCTAssertEqual(self.testViewModel.maxTemperature, "H: 85", "Max temperature is not correct")
                XCTAssertEqual(self.testViewModel.minTemperature, "L: 75", "Min temperature is not correct")
                XCTAssertEqual(self.testViewModel.temperatureLabel, "82", "Temperature label is not correct")
                XCTAssertEqual(self.testViewModel.weatherCondition, "Clouds", "Weather condition is not correct")
            }
        }
    }
    
    func testWeatherByCityError() {
        testDatamanager = WeatherSearchMockDataManager()
        testDatamanager.didAPISucceed = false
        testViewModel = WeatherSearchViewModel(with: testDatamanager)
        
        testViewModel.getWeatherDetails(with: "New York") { status in
            if !status {
                XCTAssertNil(self.testViewModel.cityName, "City name is not correct")
                XCTAssertEqual(self.testViewModel.imageUrl, "", "ImageUrl is not correct")
                XCTAssertEqual(self.testViewModel.maxTemperature, "H: -459", "Max temperature is not correct")
                XCTAssertEqual(self.testViewModel.minTemperature, "L: -459", "Min temperature is not correct")
                XCTAssertEqual(self.testViewModel.temperatureLabel, "-459", "Temperature label is not correct")
                XCTAssertEqual(self.testViewModel.weatherCondition, "", "Weather condition is not correct")
            }
        }
    }
    
    func testWeatherHappyPath() {
        testViewModel.getWeatherForCurrentLocation(callback: { status in
            if status {
                XCTAssertEqual(self.testViewModel.cityName, "New York", "City name is not correct")
                XCTAssertEqual(self.testViewModel.imageUrl, "https://openweathermap.org/img/wn/02n@2x.png", "ImageUrl is not correct")
                XCTAssertEqual(self.testViewModel.maxTemperature, "H: 85", "Max temperature is not correct")
                XCTAssertEqual(self.testViewModel.minTemperature, "L: 75", "Min temperature is not correct")
                XCTAssertEqual(self.testViewModel.temperatureLabel, "82", "Temperature label is not correct")
                XCTAssertEqual(self.testViewModel.weatherCondition, "Clouds", "Weather condition is not correct")
            }
        })
    }
    
    func testWeatherError() {
        testDatamanager = WeatherSearchMockDataManager()
        testDatamanager.didAPISucceed = false
        testViewModel = WeatherSearchViewModel(with: testDatamanager)
        
        testViewModel.getWeatherForCurrentLocation(callback: { status in
            if !status {
                XCTAssertNil(self.testViewModel.cityName, "City name is not correct")
                XCTAssertEqual(self.testViewModel.imageUrl, "", "ImageUrl is not correct")
                XCTAssertEqual(self.testViewModel.maxTemperature, "H: -459", "Max temperature is not correct")
                XCTAssertEqual(self.testViewModel.minTemperature, "L: -459", "Min temperature is not correct")
                XCTAssertEqual(self.testViewModel.temperatureLabel, "-459", "Temperature label is not correct")
                XCTAssertEqual(self.testViewModel.weatherCondition, "", "Weather condition is not correct")
            }
        })
    }

}
