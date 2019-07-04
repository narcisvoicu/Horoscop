//
//  SignCollectionViewCell.swift
//  Horoscop
//
//  Created by Voicu Narcis on 09/09/2017.
//  Copyright © 2017 Voicu Narcis. All rights reserved.
//

import UIKit

class SignCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak private var signImageView: UIImageView!
    @IBOutlet weak private var signNameLabel: UILabel!
    
    class var reuseIdentifier: String {
        return "SignCollectionViewCell"
    }
    
    override func awakeFromNib() {
        setupUI()
    }
    
    public func setupCellData(sign: Sign) {
        signNameLabel.text = sign.signName
        signImageView.image = UIImage(named: sign.signImageName)
    }
    
    private func setupUI() {
        signNameLabel.textColor = UIColor.white
    }
    
}
