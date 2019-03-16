//
//  SignDetailedWebViewPresenter.swift
//  Horoscop
//
//  Created by Narcis Voicu on 18/07/2018.
//  Copyright © 2018 Voicu Narcis. All rights reserved.
//

import Foundation
import FirebaseDatabase
import WebKit

class SignDetailedWebViewPresenter {
    
    fileprivate var signProtocol: SignProtocol
    private let service = NetworkService()
    private let databaseReference = Database.database().reference()
    
    init(signProtocol: SignProtocol) {
        self.signProtocol = signProtocol
    }
    
    public func makeFirebaseCall(choice: HoroscopeChoice,
                                 completion: @escaping (String?, Bool, Bool) -> Void) {
        let signName = signProtocol.getSignImage()
        var hasResponded = false
        
        service.fetchFirebaseData(databaseReference: databaseReference,
                                  path: "signs/\(signName)/\(choice)") { (snapshot, error) in
            if let snapshot = snapshot {
                hasResponded = true
                completion(snapshot.value as? String, false, false)
            } else if let error = error {
                hasResponded = true
                completion("Something went wrong\n Error received: \(error)", true, false)
            }
        }
        
        service.setTimeout {
            if !hasResponded {
                self.databaseReference.removeAllObservers()
                completion(ErrorConstants.timeoutError, false, true)
            }
        }
    }
    
    func dailyButtonTapped(webview: WKWebView, activityIndicator: UIActivityIndicatorView) {
        let url = signProtocol.getDailyHoroscope()
        if let myUrl = URL(string: url) {
            let myRequest = URLRequest(url: myUrl)
            webview.load(myRequest)
            activityIndicator.startAnimating()
        }
    }

}
