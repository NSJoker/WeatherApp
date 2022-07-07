//
//  City.swift
//  WeatherAppCombine
//
//  Created by Chandrachudh on 06/07/22.
//

import Foundation

/// All the required cities can be added here. The rawvalue is the city name required in the openweather API calls
enum City: String, CaseIterable {
    case gothenberg = "Gothenburg"
    case stockholm = "Stockholm"
    case mountainView = "Mountain View"
    case london = "London"
    case newYork = "New York"
    case berlin = "Berlin"
    
    var urlRequest: URLRequest {
        switch self {
        case .london:
            return .london
        case .gothenberg:
            return .gothenberg
        case .stockholm:
            return .stockholm
        case .mountainView:
            return .mountainView
        case .newYork:
            return .newYork
        case .berlin:
            return .berlin
        }
    }
    
    func getWeatherPublisher() -> WeatherPublisher {
        return WeatherService().fetchWeatherData(for: self)
    }
}
