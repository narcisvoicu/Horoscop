//
//  SignDetailedCompatibilityPresenter.swift
//  Horoscop
//
//  Created by Narcis Voicu on 17/07/2018.
//  Copyright © 2018 Voicu Narcis. All rights reserved.
//

import Foundation
import FirebaseDatabase

class SignDetailedCompatibilityPresenter {
    
    /*
    private var databaseReference: DatabaseReference
    private var errorViewController: ErrorViewController
    private let servive = NetworkService()
    
    init(databaseReference: DatabaseReference, firstSignProtocol: SignProtocol, secondSignProtocol: SignProtocol, errorViewController: ErrorViewController) {
        self.databaseReference = databaseReference
        self.firstSignProtocol = firstSignProtocol
        self.secondSignProtocol = secondSignProtocol
        self.errorViewController = errorViewController
    }
    
    public func getFirebaseCompatibility(textView: UITextView, activityIndicator: UIActivityIndicatorView, parentViewController: SignDetailedCompatibilityViewController) {
        activityIndicator.startAnimating()
        var hasResponded = false
        guard let firstSignName = firstSignProtocol?.getSignImage(),
            let secondSignName = secondSignProtocol?.getSignImage() else {
            errorViewController.setErrorTexts(errorText: ErrorConstants.normalError, imageName: ImageNames.whiteRobot, textView: textView, onParentViewController: parentViewController)
            activityIndicator.stopAnimating()
            return
        }
        databaseReference.child("signs").child(firstSignName).child("compatibility").child(secondSignName)
            .observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? String
            textView.text = value
            activityIndicator.stopAnimating()
            hasResponded = true
        }) { (error) in
            self.errorViewController.setErrorTexts(errorText: ErrorConstants.somethingWrongError, imageName: ImageNames.whiteRobot, textView: textView, onParentViewController: parentViewController)
            activityIndicator.stopAnimating()
            hasResponded = true
        }
        
        servive.setTimeout {
            if !hasResponded {
                self.databaseReference.removeAllObservers()
                activityIndicator.stopAnimating()
                self.errorViewController.setErrorTexts(errorText: ErrorConstants.timeoutError, imageName: ImageNames.whiteNoInternet, textView: textView, onParentViewController: parentViewController)
            }
        }
    }
 */
    
}
