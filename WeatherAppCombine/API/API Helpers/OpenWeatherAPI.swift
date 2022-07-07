//
//  OpenWeatherAPI.swift
//  WeatherAppCombine
//
//  Created by Chandrachudh on 06/07/22.
//

import Foundation

/// All the API related data are stored here. We can store this in the Plist as well or we can move these to more secured locations
struct OpenWeatherAPI {
    static let scheme = "https"
    static let host = "api.openweathermap.org"
    static let weatherAPIPath = "/data/2.5/weather"
    static let key = "3eeadbca19de7c685482bb6c4aa1ea73"
    static let imageDomain = "https://openweathermap.org/img/wn/"
}
