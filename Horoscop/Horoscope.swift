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

struct TodayHoroscope: Decodable {
    let date: String
    let horoscope: String
    let sunsign: String
}

struct WeekHoroscope: Decodable {
    let week: String
    let horoscope: String
    let sunsign: String
}

struct MonthHoroscope: Decodable {
    let month: String
    let horoscope: String
    let sunsign: String
}

struct YearHoroscope: Decodable {
    let year: String
    let horoscope: String
    let sunsign: String
}
