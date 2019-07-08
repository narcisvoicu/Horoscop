//
//  SignDetailedWebViewPresenter.swift
//  Horoscop
//
//  Created by Narcis Voicu on 18/07/2018.
//  Copyright © 2018 Voicu Narcis. All rights reserved.
//

import Foundation

class SignDetailsViewModel {
    
    public var horoscope: Horoscope?
    public var sign: Sign?
    
    init(horoscope: Horoscope, sign: Sign) {
        self.horoscope = horoscope
        self.sign = sign
    }
}

 
