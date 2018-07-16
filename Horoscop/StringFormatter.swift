//
//  StringFormatter.swift
//  Horoscop
//
//  Created by Narcis Voicu on 12/07/2018.
//  Copyright © 2018 Voicu Narcis. All rights reserved.
//

import Foundation

struct DateFormat {
    static func getCurrentDate() -> String {
        let inputDate = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ro_RO")
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "EEEE, dd-MMM-yyyy", options: 0, locale: dateFormatter.locale)
        
        let romanianDate = dateFormatter.string(from: inputDate)
        
        return romanianDate
    }
}

struct HoroscopeTrimmer {
    static func getHoroscope(entireDescription: String, upperLimit: String, lowerLimit: String) -> String {
        guard let topRange = entireDescription.range(of: upperLimit)?.upperBound else {
            return ErrorConstants.normalError
        }
        let newString = entireDescription.substring(from: topRange)
        
        guard let downRange = newString.range(of: lowerLimit)?.lowerBound else {
            return ErrorConstants.normalError
        }
        let finalString = newString.substring(to: downRange)
        
        return finalString
    }
}
