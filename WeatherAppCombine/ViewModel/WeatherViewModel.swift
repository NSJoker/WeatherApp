//
//  WeatherViewModel.swift
//  WeatherAppCombine
//
//  Created by Chandrachudh on 06/07/22.
//

import Foundation
import Combine

// The View model for handling the cities we are showing.
class WeatherViewModel: ObservableObject {
    
    // The original cities collections
    private let cityViewModels: [CityViewModel] = {
        var models = [CityViewModel]()
        for city in City.allCases {
            models.append(CityViewModel(city: city, publisher: city.getWeatherPublisher()))
        }
        return models
    }()
    
    // The collection we show to the view
    @Published var citiesToShow = [CityViewModel]()
    
    @Published var searchText: String = ""
    
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        bindSearchTextChanges()
    }
    
    private func bindSearchTextChanges() {
        self.$searchText
            .sink { newValue in
            self.search(for: newValue)
        }
        .store(in: &subscriptions)
    }
    
    private func search(for text: String) {
        if searchText.isEmpty {
            citiesToShow.removeAll()
            citiesToShow.append(contentsOf: cityViewModels)
            return
        }
        
        citiesToShow = self.cityViewModels.compactMap({ cityModel in
            if cityModel.city.rawValue.localizedCaseInsensitiveContains(text) {
                return cityModel
            }
            return nil
        })
    }
    
    deinit {
        for subscription in subscriptions {
            subscription.cancel()
        }
    }
}
