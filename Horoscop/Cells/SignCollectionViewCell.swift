//
//  SignCollectionViewCell.swift
//  Horoscop
//
//  Created by Voicu Narcis on 09/09/2017.
//  Copyright © 2017 Voicu Narcis. All rights reserved.
//

import UIKit
import SDWebImageSVGCoder

class SignCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak private var signImageView: UIImageView!
    @IBOutlet weak private var signNameLabel: UILabel!
    
    class var reuseIdentifier: String {
        return "SignCollectionViewCell"
    }
    
    override func awakeFromNib() {
        setupUI()
    }
    
    public func setupCell(with sign: Sign) {
        signNameLabel.text = sign.signName
        if let urlPath = Bundle.main.path(forResource: sign.signImageName, ofType: "svg") {
            let image = SDSVGImage(contentsOfFile: urlPath)
            signImageView.image = image
        }
    }
    
    private func setupUI() {
        signNameLabel.textColor = UIColor.black
    }
    
}
