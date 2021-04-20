//
//  CurrentWeatherModel.swift
//  WethearApp
//
//  Created by Hiram Castro on 19/04/21.
//

import Foundation

struct CurrentWeatherModel:Codable {
    var id:String? = UUID().uuidString
    
    let weatherText: String
    let isDayTime:Bool
    let temperature:TemperatureUnit
    
    enum CodingKeys: String, CodingKey {
        case id
        case weatherText = "WeatherText"
        case isDayTime = "IsDayTime"
        case temperature = "Temperature"
    }
    
    struct TemperatureUnit:Codable {
        let metric: TemperatureValue
        let imperial: TemperatureValue
        
        enum CodingKeys: String, CodingKey {
            case metric = "Metric"
            case imperial = "Imperial"
        }
    }
    
    struct TemperatureValue:Codable {
        let tempValue:Double
        let tempUnit:String
        
        enum CodingKeys: String, CodingKey {
            case tempValue = "Value"
            case tempUnit = "Unit"
        }
    }
    
}

extension CurrentWeatherModel {
    static func mock() -> CurrentWeatherModel {
        return CurrentWeatherModel(weatherText: "Mostly Sunny",
                                   isDayTime: true,
                                   temperature: CurrentWeatherModel.TemperatureUnit(metric: TemperatureValue(tempValue: 150, tempUnit: "F"),
                                                                                    imperial: TemperatureValue(tempValue: 12.8, tempUnit: "C")))
    }
}
