//
//  HoroscopeService.swift
//  Horoscop
//
//  Created by Voicu, Narcis-Florin-Stefan (RO - Bucharest) on 10/06/2019.
//  Copyright © 2019 Voicu Narcis. All rights reserved.
//

import Foundation

struct ServiceResource<T> {
    let horoscopeType: HoroscopeType
    let parse: (Data) throws -> T
}

extension ServiceResource where T: Decodable {
    // init for JSON decoding
    init(json horoscopeType: HoroscopeType) {
        self.horoscopeType = horoscopeType
        self.parse = { data in
            try JSONDecoder().decode(T.self, from: data)
        }
    }
}

struct HoroscopeService {
    
    private var sign: Sign
    
    init(sign: Sign) {
        self.sign = sign
    }
    
    func loadHoroscope<T>(with serviceResource: ServiceResource<T>,
                          completion: @escaping (Error?, T?) -> Void) {
        guard let url = URLFactory(horoscopeType: serviceResource.horoscopeType, signName: sign.signName).createURL() else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(error, nil)
                return
            }
            
            guard let data = data else {
                completion(ServiceError.generic, nil)
                return
            }
            
            if let horoscope = try? serviceResource.parse(data) {
                completion(nil, horoscope)
            } else {
                completion(nil, nil)
            }
        }
        
        task.resume()
    }
    
    
    enum ServiceError: Error {
        case generic
    }
    
}
