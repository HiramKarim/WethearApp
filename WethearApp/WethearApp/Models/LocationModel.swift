//
//  LocationModel.swift
//  WethearApp
//
//  Created by Hiram Castro on 16/04/21.
//

import Foundation

struct LocationModel: Codable, Identifiable {
    
    var id:String? = UUID().uuidString
    
    let key:String
    let localizedName:String
    let country: Country
    let administrativeArea: CountryState
    
    enum CodingKeys: String, CodingKey {
        case id
        case key = "Key"
        case localizedName = "LocalizedName"
        case country = "Country"
        case administrativeArea = "AdministrativeArea"
    }
    
    struct Country: Codable {
        let localizedName:String
        
        enum CodingKeys: String, CodingKey {
            case localizedName = "LocalizedName"
        }
    }
    
    struct CountryState: Codable {
        let localizedName:String
        
        enum CodingKeys: String, CodingKey {
            case localizedName = "LocalizedName"
        }
    }
    
}


extension LocationModel {
    static func mock() -> LocationModel {
        return LocationModel(key: "108714", localizedName: "Arizona", country: Country(localizedName: "USA"), administrativeArea: CountryState(localizedName: ""))
    }
}
