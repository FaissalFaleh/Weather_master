//
//  CityDetailsViewController.swift
//  OpenWeather
//
//  Created by Faissal FALEH on 25/02/2023.
//  Copyright © 2023 Faissal FALEH. All rights reserved.
//

import OpenWeatherFramework
import UIKit

class CityDetailsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var weatherDesciption: UILabel!
    @IBOutlet weak var weatherValue: UILabel!
    @IBOutlet weak var sunsetTime: UILabel!
    @IBOutlet weak var sunriseTime: UILabel!
    @IBOutlet weak var pressure: UILabel!
    @IBOutlet weak var humidity: UILabel!
    
    // MARK: - Properties
    var cityDetailsVM = CityDetailsViewModel()

    // MARK: - Inherit
    override func viewDidLoad() {
        cityDetailsVM.delegate = self
        cityDetailsVM.updateWeather()
    }

    // MARK: - Action
    @IBAction func backToList(_ sender: Any){
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - Extension (CityDetailsDelegate)
extension CityDetailsViewController: CityDetailsDelegate {
    func displayError() {
        let alertController = UIAlertController(title: nil, message: "Cant fetch wether details", preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .cancel)
        alertController.addAction(action)
        present(alertController, animated: true) {}
    }
    
    func updateView(currentCity: WeatherInfo) {
        let currentCity = cityDetailsVM.currentCity
        DispatchQueue.main.async { [weak self ] in
            self?.cityName.text = currentCity?.name
            self?.weatherDesciption.text = currentCity?.weather.first?.main
            self?.weatherValue.text = currentCity?.main?.temp.toCelsius
            self?.sunsetTime.text =  Double(currentCity?.sys?.sunset ?? 0).toStringDate
            self?.sunriseTime.text = Double(currentCity?.sys?.sunrise ?? 0).toStringDate
            self?.pressure.text = "\(currentCity?.main?.pressure ?? 0) hPa"
            self?.humidity.text = "\( currentCity?.main?.humidity ?? 0) %"
        }
    }
}
