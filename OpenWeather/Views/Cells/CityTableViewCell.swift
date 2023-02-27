//
//  CityTableViewCell.swift
//  OpenWeather
//
//  Created by Faissal FALEH on 25/02/2023.
//  Copyright © 2023 Faissal FALEH. All rights reserved.
//

import Foundation
import UIKit
import OpenWeatherFramework

class CityTableViewCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var weatherImg: UIImageView!
    @IBOutlet weak var weatherValue: UILabel!

    // MARK: - Inherit
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Public
    func configure(cityData: WeatherInfo) {
        cityName.text = cityData.name
        weatherValue.text = cityData.main?.temp.toCelsius
        weatherImg.image = UIImage(named: cityData.weather.last?.icon ?? "")
    }
}
