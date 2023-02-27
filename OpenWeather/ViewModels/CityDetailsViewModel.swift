//
//  CityDetailsViewModel.swift
//  OpenWeather
//
//  Created by Faissal FALEH on 25/02/2023.
//  Copyright © 2023 Faissal FALEH. All rights reserved.
//

import OpenWeatherFramework

protocol CityDetailsDelegate: AnyObject {
    func updateView(currentCity: WeatherInfo)
    func displayError()
}

class CityDetailsViewModel {
    // MARK: - Properties
    var currentCity: WeatherInfo?
    weak var delegate: CityDetailsDelegate?

    // MARK: - Inherit
    init(currentCity: WeatherInfo? = nil) {
        self.currentCity = currentCity
    }

    // MARK: - Public
    // Update current city weather info
    func updateWeather() {
        OpenWeatherKit.instance.getCurrentWeather(forCity: currentCity?.name ?? "", model: WeatherInfo.self) {[weak self]
            (weatherInfo, error) in
            self?.currentCity = weatherInfo
            if error == nil, let weatherInfo = weatherInfo {
                DispatchQueue.main.async {
                    try? RealmManager.basic.save(object: weatherInfo)
                    CitiesManager.shared.saveCity(city: weatherInfo)
                    self?.delegate?.updateView(currentCity: weatherInfo)
                }
            } else {
                self?.delegate?.displayError()
            }
        }
    }

}
