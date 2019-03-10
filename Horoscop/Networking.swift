//
//  Networking.swift
//  Horoscop
//
//  Created by Narcis Voicu on 23/07/2018.
//  Copyright © 2018 Voicu Narcis. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct NetworkService {
    let timeout = 5.0
    
    func setTimeout(completionBlock: @escaping () -> Void) {
        Timer.scheduledTimer(withTimeInterval: self.timeout, repeats: false) { (_) in
            completionBlock()
        }
    }
    
    func fetchFirebaseData(databaseReference: DatabaseReference = Database.database().reference(),
                           path: String,
                           completion: @escaping (DataSnapshot?, Error?) -> Void) {
        databaseReference.child(path).observeSingleEvent(of: .value,
                                                         with: { snapshot in
                                                            completion(snapshot, nil)
        }) { error in
            completion(nil, error)
        }
    }

}
