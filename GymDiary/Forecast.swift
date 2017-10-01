//
//  forecast.swift
//  GymDiary
//
//  Created by Lukey Sew on 1/10/17.
//  Copyright © 2017 Luke Sewart. All rights reserved.
//

import Foundation
import Alamofire

class Forecast
{
    // https://api.darksky.net/forecast/70374cf80a30b9355bb3a02f97917112/37.8267,-122.4233
    let forecastAPIKey: String
    let forecastURL: URL?
    init(APIKey: String)
    {
        self.forecastAPIKey = APIKey
        forecastURL = URL(string: "https://api.darksky.net/forecast/\(APIKey)")
    }
    func getCurrentWeather(latitude: Double, longitude: Double, completion: @escaping (CurrentWeather?) -> Void)
    {
        if let forecastURL = URL(string: "\(forecastURL!)/\(latitude),\(longitude)"){
            Alamofire.request(forecastURL).responseJSON(completionHandler:{ (response) in
                let jsonDictionary = response.result.value as? [String: Any]
                    if let currentWeather = jsonDictionary!["currently"] as?
                        [String : Any] {
                        let currentWeatherResult = CurrentWeather(weatherDictionary: currentWeather, city: jsonDictionary!["timezone"] as! String)
                        completion(currentWeatherResult)
                    } else {
                        completion(nil)
                }
            
            })
        }
        
        
        
    }
}
