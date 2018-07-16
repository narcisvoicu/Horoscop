//
//  Colors.swift
//  Horoscop
//
//  Created by Narcis Voicu on 14/01/2018.
//  Copyright © 2018 Voicu Narcis. All rights reserved.
//

import Foundation
import UIKit

struct Colors {
    static func lightGray() -> UIColor {
        return UIColor(displayP3Red: 139/255, green: 139/255, blue: 139/255, alpha: 0.2)
    }
    
    static func gray() -> UIColor {
        return UIColor(displayP3Red: 112/255, green: 112/255, blue: 112/255, alpha: 0.2)
    }
    
    static func darkGray() -> UIColor {
        return UIColor(displayP3Red: 95/255, green: 95/255, blue: 95/255, alpha: 0.2)
    }
    
    static func almostblack() -> UIColor {
        return UIColor(displayP3Red: 64/255, green: 64/255, blue: 64/255, alpha: 0.2)
    }
    
    static func backgroundColor() -> UIColor {
        return UIColor(patternImage: UIImage(named: "wallpaperHoroscop4")!)
    }
}
