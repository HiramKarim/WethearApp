//
//  CurrentWeatherView.swift
//  WethearApp
//
//  Created by Hiram Castro on 19/04/21.
//

import SwiftUI

struct CurrentWeatherView: View {
    
    var city:String
    var currentWeather:CurrentWeatherModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text(city)
                .font(.custom("Helvetica-Neue", size: 30))
            
            Text(currentWeather.weatherText)
                .font(.callout)
            
            Text(Helper.temperatureDisplay(value: currentWeather.temperature.imperial.tempValue,
                                           unit: .fahrenheit) + currentWeather.temperature.imperial.tempUnit)
                .font(.custom("HelveticaNeue-Light", size: 60))
        }
        .frame(height: 160)
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView(city: "Arizona",
                           currentWeather: CurrentWeatherModel.mock())
    }
}
