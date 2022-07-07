//
//  URLComponents.swift
//  WeatherAppCombine
//
//  Created by Chandrachudh on 06/07/22.
//

import Foundation

extension URLComponents {
    
    /// The URLComponents to fetch London's weather data
    static var london: Self {
        return Self(host: OpenWeatherAPI.host, path: OpenWeatherAPI.weatherAPIPath, queryItems: getQueryItems(for: "London"))
    }
    
    /// The URLComponents to fetch Gothenburg's weather data
    static var gothenberg: Self {
        return Self(host: OpenWeatherAPI.host, path: OpenWeatherAPI.weatherAPIPath, queryItems: getQueryItems(for: "Gothenburg"))
    }
    
    /// The URLComponents to fetch Stockholm's weather data
    static var stockholm: Self {
        return Self(host: OpenWeatherAPI.host, path: OpenWeatherAPI.weatherAPIPath, queryItems: getQueryItems(for: "Stockholm"))
    }
    
    /// The URLComponents to fetch Mountain View, US's weather data
    static var mountainView: Self {
        return Self(host: OpenWeatherAPI.host, path: OpenWeatherAPI.weatherAPIPath, queryItems: getQueryItems(for: "Mountain View"))
    }
    
    /// The URLComponents to fetch New York's weather data
    static var newYork: Self {
        return Self(host: OpenWeatherAPI.host, path: OpenWeatherAPI.weatherAPIPath, queryItems: getQueryItems(for: "New York"))
    }
    
    /// The URLComponents to fetch Berlin's weather data
    static var berlin: Self {
        return Self(host: OpenWeatherAPI.host, path: OpenWeatherAPI.weatherAPIPath, queryItems: getQueryItems(for: "Berlin"))
    }
    
    
    
    static private let defaultQueryItems = [URLQueryItem(name: "mode", value: "json"),
                                    URLQueryItem(name: "units", value: "metric"),
                                    URLQueryItem(name: "APPID", value: OpenWeatherAPI.key)]
    
    static private func getQueryItems(for city: String) -> [URLQueryItem] {
        var queryItems = [URLQueryItem(name: "q", value: city)]
        queryItems.append(contentsOf: URLComponents.defaultQueryItems)
        return queryItems
    }
}
