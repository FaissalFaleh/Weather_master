//
//  OpenWeatherKit.swift
//  OpenWeatherFramework
//
//  Created by Faissal FALEH on 25/02/2023.
//  Copyright © 2023 Faissal FALEH. All rights reserved.
//

import Foundation

public class OpenWeatherKit {

    private static var apiKey: String?
    public static let instance = OpenWeatherKit()

    private init() {}

    public class func initialize(apiKey: String) {
        self.apiKey = apiKey
    }

    /// Request current weather for provided city
    /// - Parameters:
    ///   - city: name of the city
    public func getCurrentWeather<T: Codable>(forCity city: String,
                                              model: T.Type,
                                     callback: @escaping (T?, Error?) -> ()) {
        OpenWeatherApi.instance.get(from: city,
                                    apiKey: OpenWeatherKit.apiKey ?? "",
                                    callback: callback)
    }
}
