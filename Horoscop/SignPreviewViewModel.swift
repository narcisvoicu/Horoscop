//
//  SignPreviewViewModel.swift
//  Horoscop
//
//  Created by Voicu, Narcis-Florin-Stefan (RO - Bucharest) on 05/07/2019.
//  Copyright © 2019 Voicu Narcis. All rights reserved.
//

import Foundation

class SignPreviewViewModel {
    
    var sign: Sign?
    
    private lazy var service: HoroscopeService? = {
        guard let sign = sign else {
            return nil
        }
        return HoroscopeService(sign: sign)
    }()
    
    init(sign: Sign) {
        self.sign = sign
    }
    
    func loadHoroscope<T>(horoscope: T.Type,
                          horoscopeType: HoroscopeType,
                          completion: @escaping (Error?, T?) -> ()) where T: Decodable {
        let resource = ServiceResource<T>(json: horoscopeType)
        service?.loadHoroscope(with: resource,
                               completion: { (error, result) in
            if let error = error {
                completion(error, nil)
            }
            
            if let result = result {
                completion(nil, result)
            } else {
                // TODO - take a look at this case
                completion(nil, nil)
            }
        })
    }
    
}
