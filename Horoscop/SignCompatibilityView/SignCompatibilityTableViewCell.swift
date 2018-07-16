//
//  SignCompatibilityTableViewCell.swift
//  Horoscop
//
//  Created by Narcis Voicu on 16/07/2018.
//  Copyright © 2018 Voicu Narcis. All rights reserved.
//

import UIKit

class SignCompatibilityTableViewCell: UITableViewCell {

    @IBOutlet weak var signImageView: UIImageView!
    @IBOutlet weak var signNameLabel: UILabel!
    
    class var reuseIdentifier: String {
        return "SignCompatibilityCell"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func setupCellData(signNames: [String], signImages: [String], indexPath: IndexPath) {
        signNameLabel.text = signNames[indexPath.row]
        signImageView.image = UIImage(named: signImages[indexPath.row])
    }

}
