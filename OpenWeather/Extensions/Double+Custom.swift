//
//  Double+Custom.swift
//  OpenWeather
//
//  Created by Faissal FALEH on 25/02/2023.
//  Copyright © 2023 Faissal FALEH. All rights reserved.
//

import Foundation

extension Double {
    // From kelvin to celsius string
    var toCelsius: String {
        return "\(Int(self - 273.15))°" 
    }
    
    // From timestamp to "HH:mm" format string
    var toStringDate: String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.timeZone = .current
        return dateFormatter.string(from: date)
    }
}
