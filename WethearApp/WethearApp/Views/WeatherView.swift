//
//  WeatherView.swift
//  WethearApp
//
//  Created by Hiram Castro on 16/04/21.
//

import SwiftUI

struct WeatherView: View {
    
    @ObservedObject var locationServices = locationService()
    @State private var showSearchView = false
    
    var body: some View {
        
        GeometryReader { geo in
            
            NavigationView {
                
                ZStack(alignment: .center) {
                    
                    Image((locationServices.currentWeather?.isDayTime ?? true) ? "bgDay" : "bgNight")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        if let location = locationServices.selectedlocation,
                           let weather = locationServices.currentWeather {
                            CurrentWeatherView(city: location.localizedName, currentWeather: weather)
                        }
                    }
                    .navigationBarItems(trailing:
                                            Button(action: {
                                                showSearchView.toggle()
                                            }, label: {
                                                Image(systemName: "magnifyingglass")
                                                    .resizable()
                                                    .frame(width: 30, height: 30)
                                            }))
                    .sheet(isPresented: $showSearchView, content: {
                        SearchView(locationServices: locationServices)
                    })
                    
                }
                
            }
            
        }
        
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
