//
//  CitiesListViewController.swift
//  OpenWeather
//
//  Created by Faissal FALEH on 25/02/2023.
//  Copyright © 2023 Faissal FALEH. All rights reserved.
//

import UIKit
import OpenWeatherFramework

class CitiesListViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var citiesTableView: UITableView!

    // MARK: - Properties
    var citiesListVM = CitiesListViewModel()
    
    // MARK: - Inherit
    override func viewDidLoad() {
        super.viewDidLoad()
        // get all stored cities for offline or restart use
        CitiesManager.shared.getAllCities()
        CitiesManager.shared.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        citiesTableView.reloadData()
    }
}

// MARK: - Extension (CitiesManagerDelegate)
extension CitiesListViewController: CitiesManagerDelegate {
    func updateCitiesList() {
        DispatchQueue.main.async { [weak self ] in
            self?.citiesTableView.reloadData()
        }
    }
}

// MARK: - Extension (UITableViewDataSource)
extension CitiesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesListVM.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.city(), for: indexPath) as! CityTableViewCell
                
        cell.configure(cityData: citiesListVM.cities[indexPath.row])
       
        return cell
    }
}
// MARK: - Extension (UITableViewDelegate)
extension CitiesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityDetailsVM = CityDetailsViewModel(currentCity: citiesListVM.cities[indexPath.row])
        guard let cityDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "CityDetailsViewController") as? CityDetailsViewController else { return }
        cityDetailsVC.cityDetailsVM = cityDetailsVM
        navigationController?.present(cityDetailsVC, animated: true, completion: nil)
    }
}
