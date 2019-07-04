//
//  HoroscopeService.swift
//  Horoscop
//
//  Created by Voicu, Narcis-Florin-Stefan (RO - Bucharest) on 10/06/2019.
//  Copyright © 2019 Voicu Narcis. All rights reserved.
//

import Foundation

struct HoroscopeService {
    
    private var sign: Sign
    
    init(sign: Sign) {
        self.sign = sign
    }
    
    mutating func getTodayHoroscope(completion: @escaping (Error?, TodayHoroscope?) -> Void) {
        guard let url = URLFactory(horoscopeType: .today, signName: sign.signName).createURL() else {
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
            
            if let horoscope = try? JSONDecoder().decode(TodayHoroscope.self, from: data) {
                completion(nil, horoscope)
            } else {
                completion(nil, nil)
            }
            
        }
        
        task.resume()
    }
    
    mutating func getWeekHoroscope(completion: @escaping (Error?, WeekHoroscope?) -> Void) {
        guard let url = URLFactory(horoscopeType: .week, signName: sign.signName).createURL() else {
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
            
            if let horoscope = try? JSONDecoder().decode(WeekHoroscope.self, from: data) {
                completion(nil, horoscope)
            } else {
                completion(nil, nil)
            }
            
        }
        
        task.resume()
    }
    
    mutating func getMonthHoroscope(completion: @escaping (Error?, MonthHoroscope?) -> Void) {
        guard let url = URLFactory(horoscopeType: .month, signName: sign.signName).createURL() else {
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
            
            if let horoscope = try? JSONDecoder().decode(MonthHoroscope.self, from: data) {
                completion(nil, horoscope)
            } else {
                completion(nil, nil)
            }
            
        }
        
        task.resume()
    }
    
    mutating func getAnnualHoroscope(completion: @escaping (Error?, YearHoroscope?) -> Void) {
        guard let url = URLFactory(horoscopeType: .year, signName: sign.signName).createURL() else {
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
            
            if let horoscope = try? JSONDecoder().decode(YearHoroscope .self, from: data) {
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
