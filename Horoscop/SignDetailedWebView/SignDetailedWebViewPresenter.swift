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
    
    private var databaseReference: DatabaseReference
    private var signProtocol: SignProtocol
    
    init(databaseReference: DatabaseReference, signProtocol: SignProtocol) {
        self.databaseReference = databaseReference
        self.signProtocol = signProtocol
    }
    
    public func getFirebaseText(textView: UITextView, choice: String) {
        let signName = signProtocol.getSignImage()
        databaseReference.child("signs").child(signName).child(choice).observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? String
            textView.text = value
        }) { (error) in
            let value = "Something went wrong\n Error received: \(error)"
            textView.text = value
        }
    }
}
