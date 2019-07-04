//
//  URLFactory.swift
//  Horoscop
//
//  Created by Voicu, Narcis-Florin-Stefan (RO - Bucharest) on 27/06/2019.
//  Copyright © 2019 Voicu Narcis. All rights reserved.
//

import Foundation

struct URLFactory {
    
    private let urlFormat = "http://horoscope-api.herokuapp.com/horoscope/%@/%@"
    
    private var horoscopeType: HoroscopeType
    private var signName: String
    
    init(horoscopeType: HoroscopeType, signName: String) {
        self.horoscopeType = horoscopeType
        self.signName = signName
    }
    
    func createURL() -> URL? {
        let urlString = String(format: urlFormat, horoscopeType.rawValue, signName)
        guard let url = URL(string: urlString) else {
            return nil
        }
        return url
    }
    
}
