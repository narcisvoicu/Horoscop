//
//  SingleInstanceSign.swift
//  Horoscop
//
//  Created by Narcis Voicu on 14/01/2018.
//  Copyright © 2018 Voicu Narcis. All rights reserved.
//

import Foundation

final class SingleInstanceSign {
    static let sharedInstance = SingleInstanceSign()
    private init() {}
    
    var signProtocol: SignProtocol?
}
