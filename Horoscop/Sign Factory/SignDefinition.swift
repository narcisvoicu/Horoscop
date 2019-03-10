//
//  SignDefinition.swift
//  Horoscop
//
//  Created by Voicu Narcis on 09/09/2017.
//  Copyright © 2017 Voicu Narcis. All rights reserved.
//

import Foundation

protocol SignProtocol {
    func getSignName()  -> String
    func getSignImage() -> String
    func getSignDates() -> String
    func getDailyHoroscope() -> String
    func getAnnualHoroscope() -> String
    func getSignProfile() -> String
}

struct Aries: SignProtocol {
    var sign: Sign
    
    init(sign: Sign) {
        self.sign = sign
    }
    
    func getSignName() -> String {
        return "Berbec"
    }
    
    func getSignImage() -> String {
        return "aries"
    }
    
    func getSignDates() -> String {
        return "21 martie - 20 aprilie"
    }
    
    func getDailyHoroscope() -> String {
        return "https://www.eastrolog.ro/horoscop-zilnic/horoscop-berbec.php"
    }
    
    func getAnnualHoroscope() -> String {
        return "https://www.eastrolog.ro/horoscop-2018/berbec.php"
    }
    
    func getSignProfile() -> String {
        return "https://www.eastrolog.ro/zodiac-european/zodia-berbec.php"
    }
    
}

struct Taurus: SignProtocol {
    var sign: Sign
    
    init(sign: Sign) {
        self.sign = sign
    }
    
    func getSignName() -> String {
        return "Taur"
    }
    
    func getSignImage() -> String {
        return "taurus"
    }
    
    func getSignDates() -> String {
        return "21 aprilie - 21 mai"
    }
    
    func getDailyHoroscope() -> String {
        return "https://www.eastrolog.ro/horoscop-zilnic/horoscop-taur.php"
    }
    
    func getAnnualHoroscope() -> String {
        return "https://www.eastrolog.ro/horoscop-2018/taur.php"
    }
    
    func getSignProfile() -> String {
        return "https://www.eastrolog.ro/zodiac-european/zodia-taur.php"
    }
}

struct Gemini: SignProtocol {
    var sign: Sign
    
    init(sign: Sign) {
        self.sign = sign
    }
    
    func getSignName() -> String {
        return "Gemeni"
    }
    
    func getSignImage() -> String {
        return "gemini"
    }
    
    func getSignDates() -> String {
        return "22 mai - 21 iunie"
    }
    
    func getDailyHoroscope() -> String {
        return "https://www.eastrolog.ro/horoscop-zilnic/horoscop-gemeni.php"
    }
    
    func getAnnualHoroscope() -> String {
        return "https://www.eastrolog.ro/horoscop-2018/gemeni.php"
    }
    
    func getSignProfile() -> String {
        return "https://www.eastrolog.ro/zodiac-european/zodia-gemeni.php"
    }
}


struct Cancer: SignProtocol {
    var sign: Sign
    
    init(sign: Sign) {
        self.sign = sign
    }
    
    func getSignName() -> String {
        return "Rac"
    }
    
    func getSignImage() -> String {
        return "cancer"
    }
    
    func getSignDates() -> String {
        return "22 iunie - 22 iulie"
    }
    
    func getDailyHoroscope() -> String {
        return "https://www.eastrolog.ro/horoscop-zilnic/horoscop-rac.php"
    }
    
    func getAnnualHoroscope() -> String {
        return "https://www.eastrolog.ro/horoscop-2018/rac.php"
    }
    
    func getSignProfile() -> String {
        return "https://www.eastrolog.ro/zodiac-european/zodia-rac.php"
    }
}

struct Leo: SignProtocol {
    var sign: Sign
    
    init(sign: Sign) {
        self.sign = sign
    }
    
    func getSignName() -> String {
        return "Leu"
    }
    
    func getSignImage() -> String {
        return "leo"
    }
    
    func getSignDates() -> String {
        return "23 iulie - 22 august"
    }
    
    func getDailyHoroscope() -> String {
        return "https://www.eastrolog.ro/horoscop-zilnic/horoscop-leu.php"
    }
    
    func getAnnualHoroscope() -> String {
        return "https://www.eastrolog.ro/horoscop-2018/leu.php"
    }
    
    func getSignProfile() -> String {
        return "https://www.eastrolog.ro/zodiac-european/zodia-leu.php"
    }
}

struct Virgo: SignProtocol {
    var sign: Sign
    
    init(sign: Sign) {
        self.sign = sign
    }
    
    func getSignName() -> String {
        return "Fecioara"
    }
    
    func getSignImage() -> String {
        return "virgo"
    }
    
    func getSignDates() -> String {
        return "23 august - 21 septembrie"
    }
    
    func getDailyHoroscope() -> String {
        return "https://www.eastrolog.ro/horoscop-zilnic/horoscop-fecioara.php"
    }
    
    func getAnnualHoroscope() -> String {
        return "https://www.eastrolog.ro/horoscop-2018/fecioara.php"
    }
    
    func getSignProfile() -> String {
        return "https://www.eastrolog.ro/zodiac-european/zodia-fecioara.php"
    }
}

struct Libra: SignProtocol {
    var sign: Sign
    
    init(sign: Sign) {
        self.sign = sign
    }
    
    func getSignName() -> String {
        return "Balanta"
    }
    
    func getSignImage() -> String {
        return "libra"
    }
    
    func getSignDates() -> String {
        return "22 septembrie - 22 octombrie"
    }
    
    func getDailyHoroscope() -> String {
        return "https://www.eastrolog.ro/horoscop-zilnic/horoscop-balanta.php"
    }
    
    func getAnnualHoroscope() -> String {
        return "https://www.eastrolog.ro/horoscop-2018/balanta.php"
    }
    
    func getSignProfile() -> String {
        return "https://www.eastrolog.ro/zodiac-european/zodia-balanta.php"
    }
}

struct Scorpio: SignProtocol {
    var sign: Sign
    
    init(sign: Sign) {
        self.sign = sign
    }
    
    func getSignName() -> String {
        return "Scorpion"
    }
    
    func getSignImage() -> String {
        return "scorpio"
    }
    
    func getSignDates() -> String {
        return "23 octombrie - 21 noiembrie"
    }
    
    func getDailyHoroscope() -> String {
        return "https://www.eastrolog.ro/horoscop-zilnic/horoscop-scorpion.php"
    }
    
    func getAnnualHoroscope() -> String {
        return "https://www.eastrolog.ro/horoscop-2018/scorpion.php"
    }
    
    func getSignProfile() -> String {
        return "https://www.eastrolog.ro/zodiac-european/zodia-scorpion.php"
    }
}

struct Sagittarius: SignProtocol {
    var sign: Sign
    
    init(sign: Sign) {
        self.sign = sign
    }
    
    func getSignName() -> String {
        return "Sagetator"
    }
    
    func getSignImage() -> String {
        return "sagittarius"
    }
    
    func getSignDates() -> String {
        return "22 noiembrie - 20 decembrie"
    }
    
    func getDailyHoroscope() -> String {
        return "https://www.eastrolog.ro/horoscop-zilnic/horoscop-sagetator.php"
    }
    
    func getAnnualHoroscope() -> String {
        return "https://www.eastrolog.ro/horoscop-2018/sagetator.php"
    }
    
    func getSignProfile() -> String {
        return "https://www.eastrolog.ro/zodiac-european/zodia-sagetator.php"
    }
}

struct Capricorn: SignProtocol {
    var sign: Sign
    
    init(sign: Sign) {
        self.sign = sign
    }
    
    func getSignName() -> String {
        return "Capricorn"
    }
    
    func getSignImage() -> String {
        return "capricorn"
    }
    
    func getSignDates() -> String {
        return "21 decembrie - 19 ianuarie"
    }
    
    func getDailyHoroscope() -> String {
        return "https://www.eastrolog.ro/horoscop-zilnic/horoscop-capricorn.php"
    }
    
    func getAnnualHoroscope() -> String {
        return "https://www.eastrolog.ro/horoscop-2018/capricorn.php"
    }
    
    func getSignProfile() -> String {
        return "https://www.eastrolog.ro/zodiac-european/zodia-capricorn.php"
    }
}

struct Aquarius: SignProtocol {
    var sign: Sign
    
    init(sign: Sign) {
        self.sign = sign
    }
    
    func getSignName() -> String {
        return "Varsator"
    }
    
    func getSignImage() -> String {
        return "aquarius"
    }
    
    func getSignDates() -> String {
        return "20 ianuarie - 18 februarie"
    }
    
    func getDailyHoroscope() -> String {
        return "https://www.eastrolog.ro/horoscop-zilnic/horoscop-varsator.php"
    }
    
    func getAnnualHoroscope() -> String {
        return "https://www.eastrolog.ro/horoscop-2018/varsator.php"
    }
    
    func getSignProfile() -> String {
        return "https://www.eastrolog.ro/zodiac-european/zodia-varsator.php"
    }
}

struct Pisces: SignProtocol {
    var sign: Sign
    
    init(sign: Sign) {
        self.sign = sign
    }
    
    func getSignName() -> String {
        return "Pesti"
    }
    
    func getSignImage() -> String {
        return "pisces"
    }
    
    func getSignDates() -> String {
        return "19 februarie - 20 martie"
    }
    
    func getDailyHoroscope() -> String {
        return "https://www.eastrolog.ro/horoscop-zilnic/horoscop-pesti.php"
    }
    
    func getAnnualHoroscope() -> String {
        return "https://www.eastrolog.ro/horoscop-2018/pesti.php"
    }
    
    func getSignProfile() -> String {
        return "https://www.eastrolog.ro/zodiac-european/zodia-pesti.php"
    }
}
