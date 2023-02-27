//
//  WeatherInfo.swift
//  OpenWeather
//
//  Created by Faissal FALEH on 26/02/2023.
//  Copyright © 2023 Faissal FALEH. All rights reserved.
//
import RealmSwift
import Realm

class WeatherInfo: Object, Codable {
    @objc dynamic var main: WeatherItem?
    @objc dynamic var name: String?
    @objc dynamic var sys: Sys?
    dynamic var weather = List<WeatherDescriptor>()
}

class WeatherDescriptor: Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var main: String?
    @objc dynamic var icon: String?
}

class WeatherItem: Object, Codable {
    @objc dynamic var pressure: Double = 0
    @objc dynamic var humidity: Int = 0
    @objc dynamic var temp: Double = 0
}

class Sys: Object, Codable {
    @objc dynamic var sunrise: Int = 0
    @objc dynamic var sunset: Int = 0
}
