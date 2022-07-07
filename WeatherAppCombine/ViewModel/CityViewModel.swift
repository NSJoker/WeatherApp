//
//  CityViewModel.swift
//  WeatherAppCombine
//
//  Created by Chandrachudh on 06/07/22.
//

import Foundation
import Combine

///The View model used in every row of our list view
class CityViewModel: ObservableObject {
    
    private let weatherInfoPublisher: WeatherPublisher
    let city: City
    
    @Published var temperature: String = "NA"
    @Published var temperatureHigh: String = "-"
    @Published var temperatureLow: String = "-"
    @Published var cityInfo: String = ""
    @Published var weatherPicURL: String = ""
    @Published var weatherDescription: String = ""
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(city: City, publisher: WeatherPublisher) {
        self.city = city
        self.weatherInfoPublisher = publisher
        self.bindService()
    }
    
    private func bindService() {
        self.weatherInfoPublisher
            .receive(on: DispatchQueue.main)// force running in main thread, since we are updating ui with respect to the response
            .sink { completion in
                print("\(self.city.rawValue) - Completion = ", completion)
            } receiveValue: { weatherInfo in
                self.temperature = String(format: "%0.0f°", weatherInfo.main.temp)
                self.temperatureHigh = "H:" + String(format: "%0.0f°", weatherInfo.main.tempMax)
                self.temperatureLow = "L:" + String(format: "%0.0f°", weatherInfo.main.tempMin)
                self.cityInfo = self.city.rawValue + ", " + weatherInfo.sys.country
                
                if let weather = weatherInfo.weather.first {
                    self.weatherPicURL = OpenWeatherAPI.imageDomain + weather.icon + "@2x.png"
                    self.weatherDescription = weather.weatherDescription.capitalized
                    print("city: \(self.city.rawValue) ---- weather image: \(OpenWeatherAPI.imageDomain + weather.icon + "@2x.png")")
                }
            }
            .store(in: &subscriptions)
    }
    
    deinit {
        for subscription in subscriptions {
            subscription.cancel()
        }
    }
}

extension CityViewModel: Hashable {
    public static func ==(lhs: CityViewModel, rhs: CityViewModel) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
