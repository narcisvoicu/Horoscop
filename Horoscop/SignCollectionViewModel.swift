//
//  SignCollectionViewModel.swift
//  Horoscop
//
//  Created by Voicu, Narcis-Florin-Stefan (RO - Bucharest) on 08/07/2019.
//  Copyright © 2019 Voicu Narcis. All rights reserved.
//

import Foundation

protocol SignCollectionViewModelProtocol {
    var numberOfItems: Int { get }
    func sign(at indexPath: IndexPath) -> Sign
}

class SignCollectionViewModel: SignCollectionViewModelProtocol {

    private let signFactory = SignFactory()
    private let signs = SignType.allCases
    
    var numberOfItems: Int {
        return signs.count
    }
    
    func sign(at indexPath: IndexPath) -> Sign {
        let signType = signs[indexPath.row]
        return signFactory.makeSign(from: signType)
    }
    
}
