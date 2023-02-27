//
//  CitiesManager.swift
//  OpenWeather
//
//  Created by Faissal FALEH on 25/02/2023.
//  Copyright © 2023 Faissal FALEH. All rights reserved.
//

protocol CitiesManagerDelegate {
    func updateCitiesList()
}
public class CitiesManager {

    // MARK: - Properties
    static let shared = CitiesManager()
    var citiesList: [WeatherInfo] = []
    var delegate: CitiesManagerDelegate? = nil
    
    // MARK: - Private
    private init() {}

    // MARK: - Public
    // We saved the cities on local database so on starting the app we fetch the cities already saved, or in case of offline mode
    func getAllCities() -> [WeatherInfo] {
        citiesList = RealmManager.basic.fetch(WeatherInfo.self, predicate: nil, sorted: nil)
        delegate?.updateCitiesList()
        return citiesList
    }


    // If the city exist remove it then insert the new data
    func saveCity(city: WeatherInfo) {
        citiesList.removeAll(where: {$0.name == city.name})
        citiesList.insert(city, at: 0)
        delegate?.updateCitiesList()
    }
}
