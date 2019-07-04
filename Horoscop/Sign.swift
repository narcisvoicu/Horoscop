//
//  Fate.swift
//  Horoscop
//
//  Created by Voicu Narcis on 03/09/2017.
//  Copyright © 2017 Voicu Narcis. All rights reserved.
//

import Foundation
import UIKit

struct Sign {
    var signName: String
    var signImageName: String
    var signDate: String
}

enum SignType: CaseIterable {
    case aries
    case taurus
    case gemini
    case cancer
    case leo
    case virgo
    case libra
    case scorpio
    case saggitarius
    case capricorn
    case aquarius
    case pisces
}
