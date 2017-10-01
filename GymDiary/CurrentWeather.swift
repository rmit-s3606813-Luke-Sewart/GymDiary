//
//  currentWeather.swift
//  GymDiary
//
//  Created by Lukey Sew on 28/9/17.
//  Copyright © 2017 Luke Sewart. All rights reserved.
//

import Foundation

class CurrentWeather {
    
    var temperature: Int?
    let icon: String?
    let location: String?
    let summary: String?
    
    struct WeatherKeys
    {
        static let city = "timezone"
        static let temperature = "temperature"
        static let icon = "icon"
        static let summary = "summary"
    }
    init(weatherDictionary: [String:Any], city: String)
    {
        temperature = weatherDictionary[WeatherKeys.temperature] as? Int
        icon = weatherDictionary[WeatherKeys.icon] as? String
        location = city
        summary = weatherDictionary[WeatherKeys.summary] as? String
        temperature = convertToCelsius(fahrenheit: temperature!)
    }
    func convertToCelsius(fahrenheit: Int) -> Int
    {
        return Int(5.0 / 9.0 * (Double(fahrenheit) - 32.0))
    }
}
