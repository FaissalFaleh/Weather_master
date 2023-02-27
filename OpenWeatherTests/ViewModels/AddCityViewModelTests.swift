//
//  AddCityViewModelTests.swift
//  OpenWeatherTests
//
//  Created by Faissal FALEH on 25/02/2023.
//  Copyright © 2023 Faissal FALEH. All rights reserved.
//

import XCTest
@testable import OpenWeather

class AddCityViewModelTests: XCTestCase {

    // Check if city exist in cityManager afetr the add
    func testGetWeather() {
        let viewModel = AddCityViewModel()
        viewModel.getWeather(cityName: "Paris")
        
        sleep(5)
        let citiesList =  CitiesManager.shared.getAllCities()
        
        XCTAssertEqual(citiesList.first(where: { $0.name == "Paris" }) != nil , true)
    }

}
