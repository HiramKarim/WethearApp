//
//  LocationService.swift
//  WethearApp
//
//  Created by Hiram Castro on 16/04/21.
//

import Foundation

class locationService: ObservableObject {
    
    @Published var searchResults = [LocationModel]()
    
    @Published var selectedlocation: LocationModel? {
        didSet {
            if let _ = selectedlocation {
                getCurrentCondition()
            }
        }
    }
    
    @Published var currentWeather: CurrentWeatherModel?
    
    var searchQuery = "" {
        didSet {
            searchLocation()
        }
    }
    
    func searchLocation() {
        searchResults = []
        
        guard let query = searchQuery
                .trimmingCharacters(in: .whitespacesAndNewlines)
                .addingPercentEncoding(withAllowedCharacters: .urlHostAllowed),
              let url = URL(string: "http://dataservice.accuweather.com/locations/v1/cities/autocomplete?apikey=\(Config.AccuWeather.apiKey)&q=\(query)")
        else {
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) {
            [weak self] (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let response = try JSONDecoder().decode([LocationModel].self, from: data)
                
                DispatchQueue.main.async {
                    self?.searchResults = response
                }
            }
            catch let error {
                print("error parsing location model: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    func getCurrentCondition() {
        
        guard let location = selectedlocation,
              let url = URL(string: "http://dataservice.accuweather.com/currentconditions/v1/\(location.key)?apikey=\(Config.AccuWeather.apiKey)")
        else {
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) {
            [weak self] (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let response = try JSONDecoder().decode([CurrentWeatherModel].self, from: data).first
                
                DispatchQueue.main.async {
                    self?.currentWeather = response
                }
            }
            catch let error {
                print("error parsing Current Weather model: \(error.localizedDescription)")
            }
        }.resume()
        
    }
    
}
