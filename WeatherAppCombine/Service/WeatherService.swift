//
//  WeatherService.swift
//  WeatherAppCombine
//
//  Created by Chandrachudh on 06/07/22.
//
import Combine
import Foundation

/// The Service which will hit the OpenWeather API and fetchs data
class WeatherService: Service {
    func fetchWeatherData(for city: City) -> WeatherPublisher {
        URLSession.shared.fetch(for: city.urlRequest, with: WeatherInfo.self)
    }
}

