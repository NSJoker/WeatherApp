//
//  Service.swift
//  WeatherAppCombine
//
//  Created by Chandrachudh on 06/07/22.
//

import Combine
import Foundation

typealias WeatherPublisher = AnyPublisher<WeatherInfo, Error>

/// The service protocol all service should follow. In case you have to create a mock service for Unit testing you can do it by confirming to this protocol
protocol Service {
    func fetchWeatherData(for city: City) -> WeatherPublisher
}
