//
//  AppDelegate.swift
//  OpenWeather
//
//  Created by Faissal FALEH on 25/02/2023.
//  Copyright © 2023 Faissal FALEH. All rights reserved.
//

import UIKit
import OpenWeatherFramework

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let apiKey = "09738b3e0e44b0a43a8b851724acb40c"
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        OpenWeatherKit.initialize(apiKey: apiKey)
        return true
    }
}
