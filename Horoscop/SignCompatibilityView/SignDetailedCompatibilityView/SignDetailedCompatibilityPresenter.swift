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
    
    private var databaseReference: DatabaseReference
    private var firstSignProtocol: SignProtocol?
    private var secondSignProtocol: SignProtocol?
    
    init(databaseReference: DatabaseReference, firstSignProtocol: SignProtocol, secondSignProtocol: SignProtocol) {
        self.databaseReference = databaseReference
        self.firstSignProtocol = firstSignProtocol
        self.secondSignProtocol = secondSignProtocol
    }
    
    public func getFirebaseCompatibility(textView: UITextView) {
        guard let firstSignName = firstSignProtocol?.getSignImage(), let secondSignName = secondSignProtocol?.getSignImage() else {
            textView.text = "Nil"
            return
        }
        databaseReference.child("signs").child(firstSignName).child("compatibility").child(secondSignName).observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? String
            textView.text = value
        }) { (error) in
            let value = "Something went wrong\n Error received: \(error)"
            textView.text = value
        }
    }
    
}
