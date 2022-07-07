//
//  URLRequests.swift
//  WeatherAppCombine
//
//  Created by Chandrachudh on 06/07/22.
//

import Foundation

extension URLRequest {
    /// The URLRequest to fetch London's weather data
    static var london: Self {
        Self(components: .london)
    }
    
    /// The URLRequest to fetch Gothenberg's weather data
    static var gothenberg: Self {
        Self(components: .gothenberg)
    }
    
    /// The URLRequest to fetch Stockholm's weather data
    static var stockholm: Self {
        Self(components: .stockholm)
    }
    
    /// The URLRequest to fetch Montain View, US's weather data
    static var mountainView: Self {
        Self(components: .mountainView)
    }
    
    /// The URLRequest to fetch New York's weather data
    static var newYork: Self {
        Self(components: .newYork)
    }
    
    /// The URLRequest to fetch Berlin's weather data
    static var berlin: Self {
        Self(components: .berlin)
    }
}
