//
//  Signs.swift
//  Horoscop
//
//  Created by Voicu, Narcis-Florin-Stefan (RO - Bucharest) on 11/06/2019.
//  Copyright © 2019 Voicu Narcis. All rights reserved.
//

import Foundation

struct SignFactory {
    
    func makeSign(from sign: SignType) -> Sign {
        switch sign {
        case .aries: return Sign(signName: "Aries",
                                 signImageName: "aries",
                                 signDate: "March 21 - April 19")
        case .taurus: return Sign(signName: "Taurus",
                                  signImageName: "taurus",
                                  signDate: "April 20 - May 20")
        case .gemini: return Sign(signName: "Gemini",
                                  signImageName: "gemini",
                                  signDate: "May 21 - June 20")
        case .cancer: return Sign(signName: "Cancer",
                                  signImageName: "cancer",
                                  signDate: "June 21 - July 22")
        case .leo: return Sign(signName: "Leo",
                               signImageName: "leo",
                               signDate: "July 23 - August 22")
        case .virgo: return Sign(signName: "Virgo",
                                 signImageName: "virgo",
                                 signDate: "August 23 - September 22")
        case .libra: return Sign(signName: "Libra",
                                 signImageName: "libra",
                                 signDate: "September 23 - October 22")
        case .scorpio: return Sign(signName: "Scorpio",
                                   signImageName: "scorpio",
                                   signDate: "October 23 - November 21")
        case .saggitarius: return Sign(signName: "Sagittarius",
                                       signImageName: "sagittarius",
                                       signDate: "November 22 - December 21")
        case .capricorn: return Sign(signName: "Capricorn",
                                     signImageName: "capricorn",
                                     signDate: "December 22 - January 19")
        case .aquarius: return Sign(signName: "Aquarius",
                                    signImageName: "aquarius",
                                    signDate: "January 20 - February 18")
        case .pisces: return Sign(signName: "Pisces",
                                  signImageName: "pisces",
                                  signDate: "February 19 - March 20")
        }
        
    }
    
}
