//
//  CountryCodes.swift
//  sofascore
//
//  Created by akademija on 07.06.2026..
//

import Foundation

enum CountryCodes {
 
    static let codes: [String: String] = {
        var dictionary: [String: String] = [:]
        let locale = Locale(identifier: "en_US")
        
        for region in Locale.Region.isoRegions {
            let code = region.identifier
            if let countryName = locale.localizedString(forRegionCode: code) {
                dictionary[countryName] = code.lowercased()
            }
        }
        
        dictionary["England"] = "gb-eng"
        dictionary["Scotland"] = "gb-sct"
        dictionary["Wales"] = "gb-wls"
        dictionary["Northern Ireland"] = "gb-nir"
        dictionary["USA"] = "us"
        dictionary["DR Congo"] = "cd"
        dictionary["Côte d'Ivoire"] = "ci"
                
        return dictionary
    }()
    
    static func getCode(countryName: String?) -> String? {
        if let countryName = countryName {
            return codes[countryName]
        }
        return nil
    }
    
    static func flagUrl(countryName: String?) -> String? {
        if let code = getCode(countryName: countryName){
            return "https://flagcdn.com/w40/\(code).png"
        }
        return nil
    }
}
