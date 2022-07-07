//
//  Colors.swift
//  WeatherAppCombine
//
//  Created by Chandrachudh on 06/07/22.
//

import SwiftUI

extension Color {
    /// The weather screen's background color
    static let backgroundColor = LinearGradient(gradient: Gradient(colors: [Color("Background 1"),
                                                                            Color("Background 2"),
                                                                            Color("Background 3")]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing)
    
    /// The weather information row's background color
    static let weatherWidgetBackground = LinearGradient(gradient: Gradient(colors: [Color("Widget Background 1"),
                                                                                    Color("Widget Background 2")]),
                                                        startPoint: .leading,
                                                        endPoint: .trailing)
}
