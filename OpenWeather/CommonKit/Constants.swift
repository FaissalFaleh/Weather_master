//
//  Constants.swift
//  OpenWeather
//
//  Created by Faissal FALEH on 24/02/2023.
//  Copyright © 2023 Faissal FALEH. All rights reserved.
//

// we created those enum althout we have one value for each enum, on the future w'll be ready to add others values
enum UserDefaultsConstant: String {
    case cities = "cities"

    func callAsFunction() -> String {
        return self.rawValue
    }
}

enum Cell: String {
    case city = "CityTableViewCell"

    func callAsFunction() -> String {
        return self.rawValue
    }
}
