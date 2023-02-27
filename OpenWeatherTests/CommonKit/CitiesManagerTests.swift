//
//  CitiesManagerTests.swift
//  OpenWeatherTests
//
//  Created by Faissal FALEH on 25/02/2023.
//  Copyright © 2023 Faissal FALEH. All rights reserved.
//

import XCTest
import OpenWeatherFramework
@testable import OpenWeather

class CitiesManagerTests: XCTestCase {
    
    var citiesManager  = CitiesManager.shared

    var mockWeatherResult: WeatherInfo {
        guard let path = Bundle.main.path(forResource: "MockWeatherResult", ofType: "json") else {
            fatalError("Can't read path")
        }
        
        do {
            let content = try String(contentsOfFile:path, encoding: String.Encoding.utf8)
            let jsonData = Data(content.utf8)
            let decoder = JSONDecoder()
            let cityWeatherInfo = try decoder.decode(WeatherInfo.self, from: jsonData)
            return cityWeatherInfo
        } catch {
            fatalError("Can't read file")
        }
    }

    // Test result after city save
    func testSaveCity()  {
        citiesManager.saveCity(city: mockWeatherResult)
        let citiesList =  CitiesManager.shared.getAllCities()
        let city = citiesList.first(where: { $0.name == "Lyon"})

        XCTAssertEqual(city?.weather.first?.id, 800)
    }
    
    // Insert the same city twice after removing all stored data -> result should be one city saved
    func testUpdateCity() {
        UserDefaults.standard.removeObject(forKey: UserDefaultsConstant.cities())

        citiesManager.saveCity(city: mockWeatherResult)
        citiesManager.saveCity(city: mockWeatherResult)
        let citiesList =  CitiesManager.shared.getAllCities
        XCTAssertEqual(citiesList().count, 1)
    }

}
