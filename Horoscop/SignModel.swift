//
//  SignModel.swift
//  Horoscop
//
//  Created by Narcis Voicu on 13/07/2018.
//  Copyright © 2018 Voicu Narcis. All rights reserved.
//

import Foundation

class SignModel {
    public var signs: [Sign] = [Sign]()
    public var signNames: [String] = [String]()
    public var signImages: [String] = [String]()
    
    init() {
        setupSigns()
    }
    
    private func setupSigns() {
        signs.append(Sign(signName: .Aries))
        signs.append(Sign(signName: .Taurus))
        signs.append(Sign(signName: .Gemini))
        signs.append(Sign(signName: .Cancer))
        signs.append(Sign(signName: .Leo))
        signs.append(Sign(signName: .Virgo))
        signs.append(Sign(signName: .Libra))
        signs.append(Sign(signName: .Scorpio))
        signs.append(Sign(signName: .Sagittarius))
        signs.append(Sign(signName: .Scorpio))
        signs.append(Sign(signName: .Aquarius))
        signs.append(Sign(signName: .Pisces))
        
        signNames = signs.map { SignFactory.getSign(sign: $0).getSignName() }
        signImages = signs.map { SignFactory.getSign(sign: $0).getSignImage() }
    }
}
