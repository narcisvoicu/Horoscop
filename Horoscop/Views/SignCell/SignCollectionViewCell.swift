//
//  SignCollectionViewCell.swift
//  Horoscop
//
//  Created by Voicu Narcis on 09/09/2017.
//  Copyright © 2017 Voicu Narcis. All rights reserved.
//

import UIKit

class SignCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var signImageView: UIImageView!
    @IBOutlet weak var signNameLabel: UILabel!
    
    override func awakeFromNib() {
        setupCell()
    }
    
    func setupCell() {
        signNameLabel.textColor = UIColor.white
    }
    
}
