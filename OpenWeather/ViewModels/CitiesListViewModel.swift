//
//  CitiesListViewModel.swift
//  OpenWeather
//
//  Created by Faissal FALEH on 25/02/2023.
//  Copyright © 2023 Faissal FALEH. All rights reserved.
//

import Foundation

class CitiesListViewModel {
    
    var cities: [WeatherInfo] {
        get {
            return CitiesManager.shared.citiesList
        }
    }
}
