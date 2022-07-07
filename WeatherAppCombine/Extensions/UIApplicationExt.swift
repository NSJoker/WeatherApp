//
//  UIApplicationExt.swift
//  WeatherAppCombine
//
//  Created by Chandrachudh on 06/07/22.
//

import UIKit

extension UIApplication {
    /// Ends editing on views
    static func endEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil,
                                        from: nil,
                                        for: nil)
    }
}
