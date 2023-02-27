//
//  OpenWeatherApi.swift
//  OpenWeatherFramework
//
//  Created by Faissal FALEH on 25/02/2023.
//  Copyright © 2023 Faissal FALEH. All rights reserved.
//

import Foundation

internal final class OpenWeatherApi {
    
    static let baseUrl = "http://api.openweathermap.org/data/2.5/weather?q="
    internal static let instance = OpenWeatherApi()

    private init() {}

    internal func get<T : Codable>(from city: String,
                                   apiKey: String,
                                   callback: @escaping (T?, Error?) -> ()) {
        guard let serviceUrl = URL(string: OpenWeatherApi.baseUrl + city + "&appid=" + apiKey) else {
            return
        }
        URLSession.shared.dataTask(with: serviceUrl) { (data, response, error) in
            if let error = error {
                callback(nil, error)
            }
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(T.self, from: data)
                callback(result, nil)
            } catch {
                callback(nil, error)
            }
        }.resume()
    }
}
