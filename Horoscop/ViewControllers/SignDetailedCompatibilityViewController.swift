//
//  SignDetailedCompatibilityViewController.swift
//  Horoscop
//
//  Created by Narcis Voicu on 17/07/2018.
//  Copyright © 2018 Voicu Narcis. All rights reserved.
//

import UIKit
import FirebaseDatabase

class SignDetailedCompatibilityViewController: UIViewController {

    @IBOutlet weak private var firstSignImageView: UIImageView!
    @IBOutlet weak private var secondSignImageView: UIImageView!
    @IBOutlet weak private var firstSignNameLabel: UILabel!
    @IBOutlet weak private var secondSignNameLabel: UILabel!
    @IBOutlet weak private var compatibilityTextView: UITextView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var signDetailedCompatibilityPresenter: SignDetailedCompatibilityPresenter?
    
    private var databaseReference: DatabaseReference!
    private var errorViewController: ErrorViewController?
    
    /*
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        setupUI()
        setupFirebaseDatabase()
    }
    
    // MARK: - Setup
    
    private func initialSetup() {
        guard let firstImageName = firstSignProtocol?.getSignImage() else {
            return
        }
        guard let secondImageName = secondSignProtocol?.getSignImage() else {
            return
        }
        firstSignImageView.image = UIImage(named: firstImageName)
        secondSignImageView.image = UIImage(named: secondImageName)
        firstSignNameLabel.text = firstSignProtocol?.getSignName()
        secondSignNameLabel.text = secondSignProtocol?.getSignName()
        compatibilityTextView.text = ""
    }
    
    private func setupUI() {
        view.backgroundColor = Colors.backgroundColor()
        compatibilityTextView.backgroundColor = UIColor.clear
        compatibilityTextView.textColor = UIColor.white
        createCircularImageView(imageView: firstSignImageView)
        createCircularImageView(imageView: secondSignImageView)
    }
    
    private func setupFirebaseDatabase() {
        databaseReference = Database.database().reference()
        
        guard let firstSignProtocol = firstSignProtocol, let secondSignProtocol = secondSignProtocol else {
            compatibilityTextView.text = ErrorConstants.showTextError
            return
        }
        
        errorViewController = NavigationCoordinator.getErrorView() as? ErrorViewController
        
        signDetailedCompatibilityPresenter = SignDetailedCompatibilityPresenter(databaseReference: databaseReference, firstSignProtocol: firstSignProtocol, secondSignProtocol: secondSignProtocol, errorViewController: errorViewController!)
        
        signDetailedCompatibilityPresenter?.getFirebaseCompatibility(textView: compatibilityTextView, activityIndicator: activityIndicator, parentViewController: self)
    }
    
    private func createCircularImageView(imageView: UIImageView) {
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
    }
*/
}
