//
//  OpenWeatherFrameworkTests.swift
//  OpenWeatherFrameworkTests
//
//  Created by Faissal FALEH on 25/02/2023.
//  Copyright © 2023 Faissal FALEH. All rights reserved.
//

import XCTest
@testable import OpenWeatherFramework

class OpenWeatherKitITTests: XCTestCase {

    override func setUp() {
        OpenWeatherKit.initialize(apiKey: "09738b3e0e44b0a43a8b851724acb40c")
    }
    
    func test_currentWeather_forCity() {
        var result: weath?
        var failError: Error?
        let ex = expectation(description: "OpenWeather should provide current weather for city")

        OpenWeatherKit.instance.getCurrentWeather(forCity: "Paris", model: WeatherInfo.self) { (cityWeatherInfo, error) in
            result = cityWeatherInfo
            if let result = result {
                XCTAssertNotNil(result.weather.last?.id)
                XCTAssertNotNil(result.weather.last?.icon)
                failError = error
                ex.fulfill()
            }
        }

        wait(for: [ex], timeout: 5.0)

        XCTAssertNotNil(result)
        XCTAssertNil(failError)
    }
}
