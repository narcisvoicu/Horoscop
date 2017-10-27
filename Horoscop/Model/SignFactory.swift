//
//  SignFactory.swift
//  Horoscop
//
//  Created by Voicu Narcis on 09/09/2017.
//  Copyright © 2017 Voicu Narcis. All rights reserved.
//

import UIKit

class SignFactory: NSObject {

   static func getSign(sign: Sign) -> SignProtocol {
        switch sign.signName {
        case .Aries:
            return Aries(sign: sign)
        case .Taurus:
            return Taurus(sign: sign)
        case .Gemini:
            return Gemini(sign: sign)
        case .Cancer:
            return Cancer(sign: sign)
        case .Leo:
            return Leo(sign: sign)
        case .Virgo:
            return Virgo(sign: sign)
        case .Libra:
            return Libra(sign: sign)
        case .Scorpio:
            return Scorpio(sign: sign)
        case .Sagittarius:
            return Sagittarius(sign: sign)
        case .Capricorn:
            return Capricorn(sign: sign)
        case .Aquarius:
            return Aquarius(sign: sign)
        case .Pisces:
            return Pisces(sign: sign)
        }
    }
}
