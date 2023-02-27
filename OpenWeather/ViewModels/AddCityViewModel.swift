//
//  AddCityViewModel.swift
//  OpenWeather
//
//  Created by Faissal FALEH on 25/02/2023.
//  Copyright © 2023 Faissal FALEH. All rights reserved.
//

import OpenWeatherFramework

// Delegate to reload the list in cities tableview
protocol AddCityDelegate: AnyObject {
    func backToList()
    func displayError()
}

class AddCityViewModel {
    // MARK: - Properties
    weak var delegate: AddCityDelegate?

    // MARK: - Public
    // get the city info for th given city name
    func getWeather(cityName: String) {
        OpenWeatherKit.instance.getCurrentWeather(forCity: cityName, model: WeatherInfo.self) {[weak self]
            (weatherInfo, error) in
            DispatchQueue.main.async {
                if error == nil, let weatherInfo = weatherInfo {
                    CitiesManager.shared.saveCity(city: weatherInfo)
                    self?.delegate?.backToList()
                } else {
                    self?.delegate?.displayError()
                }
            }

        }
    }
}
