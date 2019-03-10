//
//  SignDetailedWebViewPresenter.swift
//  Horoscop
//
//  Created by Narcis Voicu on 18/07/2018.
//  Copyright © 2018 Voicu Narcis. All rights reserved.
//

import Foundation
import FirebaseDatabase

class SignDetailedWebViewPresenter {
    
    private var signProtocol: SignProtocol
    private let service = NetworkService()
    private let databaseReference = Database.database().reference()
    
    init(signProtocol: SignProtocol) {
        self.signProtocol = signProtocol
    }
    
    public func makeFirebaseCall(choice: String,
                                 completion: @escaping (String?, Bool) -> Void) {
        let signName = signProtocol.getSignImage()
        var hasResponded = false
        
        service.fetchFirebaseData(databaseReference: databaseReference,
                                  path: "signs/\(signName)/\(choice)") { (snapshot, error) in
            if let snapshot = snapshot {
                hasResponded = true
                completion(snapshot.value as? String, false)
            } else if let error = error {
                hasResponded = true
                completion("Something went wrong\n Error received: \(error)", true)
            }
        }
        
        service.setTimeout {
            if !hasResponded {
                self.databaseReference.removeAllObservers()
                completion(ErrorConstants.timeoutError, true)
            }
        }
        
        
//        databaseReference.child("signs").child(signName).child(choice).observeSingleEvent(of: .value, with: { (snapshot) in
//            let value = snapshot.value as? String
//            textView.text = value
//            activityIndicator.stopAnimating()
//            hasResponded = true
//        }) { (error) in
//            let value = "Something went wrong\n Error received: \(error)"
//            textView.text = value
//            activityIndicator.stopAnimating()
//            hasResponded = true
//        }
//
//        service.setTimeout() {
//            if !hasResponded {
//                self.databaseReference.removeAllObservers()
//                activityIndicator.stopAnimating()
//                self.errorViewController.setErrorTexts(errorText: ErrorConstants.timeoutError, imageName: ImageNames.whiteNoInternet, textView: textView, onParentViewController: parentViewController)
//            }
//        }
    }
}
