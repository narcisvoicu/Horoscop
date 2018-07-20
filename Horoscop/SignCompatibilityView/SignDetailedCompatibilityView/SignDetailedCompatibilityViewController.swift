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
    
    public var firstSignProtocol: SignProtocol?
    public var secondSignProtocol: SignProtocol?
    private var signDetailedCompatibilityPresenter: SignDetailedCompatibilityPresenter?
    
    private var databaseReference: DatabaseReference!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        setupUI()
        setupFirebaseDatabase()
        
        signDetailedCompatibilityPresenter?.getFirebaseCompatibility(textView: compatibilityTextView)
    }
    
    // MARK: - Setup
    
    private func initialSetup() {
        guard let firstImageName = firstSignProtocol?.getSignImage() else {
            return
        }
        guard let secondImageName = secondSignProtocol?.getSignName() else {
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
        createCircularImageView(imageView: firstSignImageView)
        createCircularImageView(imageView: secondSignImageView)
    }
    
    private func setupFirebaseDatabase() {
        Database.database().isPersistenceEnabled = true
        databaseReference = Database.database().reference()
        
        guard let firstSignProtocol = firstSignProtocol, let secondSignProtocol = secondSignProtocol else {
            compatibilityTextView.text = ErrorConstants.showTextError
            return
        }
        signDetailedCompatibilityPresenter = SignDetailedCompatibilityPresenter(databaseReference: databaseReference, firstSignProtocol: firstSignProtocol, secondSignProtocol: secondSignProtocol)
    }
    
    private func createCircularImageView(imageView: UIImageView) {
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
    }

}
