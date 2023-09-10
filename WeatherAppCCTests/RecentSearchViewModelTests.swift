//
//  RecentSearchViewModelTests.swift
//  WeatherAppCCTests
//
//  Created by Ragha Sindhura Kurella Venkata Subba on 9/9/23.
//

import XCTest
@testable import WeatherAppCC

final class RecentSearchViewModelTests: XCTestCase {
    var testViewModel: RecentSearchViewModel!
    var testDatamanager: RecentSearchMockDataManager!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        testDatamanager = RecentSearchMockDataManager()
        testViewModel = RecentSearchViewModel(with: testDatamanager)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        testDatamanager = nil
        testViewModel = nil
    }
    
    func testRecentSearch() {
        testViewModel.getHistory()
        
        XCTAssertEqual(testViewModel.rows, 2, "count incorrect")
        XCTAssertEqual(testViewModel.cityName(at: 0), "New York (82) Fahrenheit", "cityName incorrect")
        XCTAssertEqual(testViewModel.cityName(at: 1), "Dallas (82) Fahrenheit", "cityName incorrect")
        XCTAssertEqual(testViewModel.cityName(at: 100), "", "cityName incorrect")
    }

}
