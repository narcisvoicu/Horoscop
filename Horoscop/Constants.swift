//
//  Constants.swift
//  Horoscop
//
//  Created by Narcis Voicu on 12/07/2018.
//  Copyright © 2018 Voicu Narcis. All rights reserved.
//

import Foundation

struct HTMLLimits {
    static let dailyUpperLimit = "2018"
    static let dailyLowerLimit = "Horoscop"
}

struct ErrorConstants {
    static let normalError = "A aparut o problema. Te rugam sa incerci mai tarziu!"
    static let showTextError = "A aparut o problema la aparitia horoscopului. Te rugam sa incerci mai tarziu!"
    static let somethingWrongError = "Ceva nu a mers bine. Te rugam sa incerci mai tarziu!"
    static let noInternetError = "Fara conexiune la Internet. Asigura-te ca device-ul tau este conectat la Internet."
    static let timeoutError = "A fost detectata o conexiune slaba. Verifica-ti setarile de Internet"
}

struct ImageNames {
    static let robot = "robot"
    static let noInternetConnection = "wifi-signal"
    static let whiteRobot = "robotic"
    static let whiteNoInternet = "wifi-signal-tower"
}
