//
//  AddCityViewController.swift
//  OpenWeather
//
//  Created by Faissal FALEH on 25/02/2023.
//  Copyright © 2023 Faissal FALEH. All rights reserved.
//

import UIKit
import OpenWeatherFramework

class AddCityViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var searchIndicator: UIActivityIndicatorView!
    @IBOutlet weak var errorSearchTxt: UILabel!
    @IBOutlet weak var cityName: UITextField!
    
    // MARK: - Properties
    let addCityVM = AddCityViewModel()

    // MARK: - Inherit
    override func viewDidLoad() {
        addCityVM.delegate = self
    }

    // MARK: - Actions
    @IBAction func getWeatherInfo(_ sender: UIButton) {
        guard let city = cityName.text else {
            return
        }
        searchIndicator.startAnimating()
        addCityVM.getWeather(cityName: city)
    }
    
    @IBAction func backToCitiesList(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - Extension (AddCityDelegate)
extension AddCityViewController: AddCityDelegate {
    func displayError() {
        searchIndicator.stopAnimating()
        errorSearchTxt.isHidden = false

    }
    
    func backToList() {
        searchIndicator.stopAnimating()
        errorSearchTxt.isHidden = true
        dismiss(animated: true, completion: nil)
    }
}
