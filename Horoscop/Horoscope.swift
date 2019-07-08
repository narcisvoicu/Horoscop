//
//  Horoscope.swift
//  Horoscop
//
//  Created by Voicu, Narcis-Florin-Stefan (RO - Bucharest) on 10/06/2019.
//  Copyright © 2019 Voicu Narcis. All rights reserved.
//

import Foundation

enum HoroscopeType: String {
    case today
    case week
    case month
    case year
}

protocol Horoscope {
    var horoscope: String { get }
    var sunsign: String { get }
}

struct TodayHoroscope: Decodable, Horoscope {
    let date: String
    let horoscope: String
    let sunsign: String
}

struct WeekHoroscope: Decodable, Horoscope {
    let week: String
    let horoscope: String
    let sunsign: String
}

struct MonthHoroscope: Decodable, Horoscope {
    let month: String
    let horoscope: String
    let sunsign: String
}

struct YearHoroscope: Decodable, Horoscope {
    let year: String
    let horoscope: String
    let sunsign: String
}
