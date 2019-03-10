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
    
    public func setupCellData(signNames: [String], signImages: [String], indexPath: IndexPath) {
        signNameLabel.text = signNames[indexPath.row]
        signImageView.image = UIImage(named: signImages[indexPath.row])
    }
    
    private func setupUI() {
        signNameLabel.textColor = UIColor.white
    }
    
}
