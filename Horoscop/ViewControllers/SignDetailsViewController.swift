//
//  WebViewController.swift
//  Horoscop
//
//  Created by Narcis Voicu on 10/07/2018.
//  Copyright © 2018 Voicu Narcis. All rights reserved.
//

import UIKit
import SDWebImageSVGCoder

enum HoroscopeChoice: String {
    case daily
    case profile
    case annual
    case compatibility
}

class SignDetailsViewController: UIViewController {

    @IBOutlet weak fileprivate var textView: UITextView!
    @IBOutlet weak fileprivate var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak private var signImageView: UIImageView!
    @IBOutlet weak private var signNameLabel: UILabel!
    @IBOutlet weak private var signDatesLabel: UILabel!
    @IBOutlet weak private var todayDateLabel: UILabel!
    
    var viewModel: SignDetailsViewModel?
    
    fileprivate var errorViewController: ErrorViewController?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        setupUI()
    }
    
    // MARK: - Setup
    
    private func initialSetup() {
        guard let viewModel = viewModel, let sign = viewModel.sign else {
            return
        }
        signNameLabel.text = sign.signName
        signDatesLabel.text = sign.signDate
        
        if let urlPath = Bundle.main.path(forResource: sign.signImageName, ofType: "svg") {
            let image = SDSVGImage(contentsOfFile: urlPath)
            signImageView.image = image
        }
        
        todayDateLabel.text = DateFormat.getCurrentDate()
        textView.text = viewModel.horoscope?.horoscope
    }
    
    private func setupUI() {
        activityIndicator.color = UIColor.white
    }
    
}


