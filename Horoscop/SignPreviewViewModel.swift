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
    
    func todayPressed(completion: @escaping (Error?, TodayHoroscope?) -> ()) {
        service?.getTodayHoroscope(completion: { (error, result) in
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
    
    func weekPressed(completion: @escaping (Error?, WeekHoroscope?) -> ()) {
        service?.getWeekHoroscope(completion: { (error, result) in
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
    
    func monthPressed(completion: @escaping (Error?, MonthHoroscope?) -> ()) {
        service?.getMonthHoroscope(completion: { (error, result) in
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
    
    func yearPressed(completion: @escaping (Error?, YearHoroscope?) -> ()) {
        service?.getAnnualHoroscope(completion: { (error, result) in
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
