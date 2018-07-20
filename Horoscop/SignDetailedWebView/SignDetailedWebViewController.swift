//
//  WebViewController.swift
//  Horoscop
//
//  Created by Narcis Voicu on 10/07/2018.
//  Copyright © 2018 Voicu Narcis. All rights reserved.
//

import UIKit
import WebKit
import FirebaseDatabase

enum HoroscopeChoice {
    case Daily
    case Profile
    case Annual
    case Compatibility
}

class SignDetailedWebViewController: UIViewController {

    @IBOutlet weak private var webView: WKWebView!
    @IBOutlet weak fileprivate var textView: UITextView!
    @IBOutlet weak fileprivate var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak private var signInfoView: UIView!
    @IBOutlet weak private var signImageView: UIImageView!
    @IBOutlet weak private var signNameLabel: UILabel!
    @IBOutlet weak private var signDatesLabel: UILabel!
    @IBOutlet weak private var todayDateLabel: UILabel!
    
    public var signProtocol: SignProtocol?
    public var horoscopeChoice: HoroscopeChoice?
    
    private var databaseReference: DatabaseReference!
    private var signDetailedWebViewPresenter: SignDetailedWebViewPresenter?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        setupUI()
        setupFirebaseDatabase()
        loadTheRightText()
    }
    
    // MARK: - Setup
    
    private func initialSetup() {
        if let signImage = signProtocol?.getSignImage() {
            signImageView.image = UIImage(named: signImage)
        }
        signNameLabel.text = signProtocol?.getSignName()
        signDatesLabel.text = signProtocol?.getSignDates()
        todayDateLabel.text = DateFormat.getCurrentDate()
        textView.text = ""
    }
    
    private func setupUI() {
        view.backgroundColor = Colors.backgroundColor()
        textView.backgroundColor = UIColor.clear
        signInfoView.backgroundColor = UIColor.clear
        activityIndicator.color = UIColor.white
    }
    
    private func setupFirebaseDatabase() {
        Database.database().isPersistenceEnabled = true
        databaseReference = Database.database().reference()
        
        guard let signProtocol = signProtocol else {
            textView.text = ErrorConstants.normalError
            return
        }
        signDetailedWebViewPresenter = SignDetailedWebViewPresenter(databaseReference: databaseReference, signProtocol: signProtocol)
    }
    
    // MARK: - Load Helper Functions
    
    private func loadRequest(withURL url: String) {
        if let myUrl = URL(string: url) {
            let myRequest = URLRequest(url: myUrl)
            webView.navigationDelegate = self
            webView.load(myRequest)
            activityIndicator.startAnimating()
        }
    }
    
    private func loadTheRightText() {
        switch horoscopeChoice {
        case .Daily?:
            guard let url = signProtocol?.getDailyHoroscope() else {
                return
            }
            loadRequest(withURL: url)
        case .Profile?:
            signDetailedWebViewPresenter?.getFirebaseText(textView: textView, choice: "profile")
        case .Annual?:
            signDetailedWebViewPresenter?.getFirebaseText(textView: textView, choice: "annual")
        case .Compatibility?:
            print("Compatibility")
        default:
            print("altceva")
        }
    }
    
}

// MARK: - Extensions

extension SignDetailedWebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.evaluateJavaScript("document.documentElement.innerText") { (html, error) in
            self.showTextByChoice(withHTML: html ?? "None")
        }
    }
    
    private func showTextByChoice(withHTML html: Any) {
        switch horoscopeChoice {
        case .Daily?:
            populateTextView(byUpperLimit: HTMLLimits.dailyUpperLimit, lowerLimit: HTMLLimits.dailyLowerLimit, html: html)
        default:
            textView.text = ErrorConstants.normalError
        }
    }
    
    private func populateTextView(byUpperLimit upperLimit: String, lowerLimit: String, html: Any) {
        guard let fullText = html as? String else {
            textView.text = ErrorConstants.showTextError
            return
        }
        let trimmedText = HoroscopeTrimmer.getHoroscope(entireDescription: fullText, upperLimit: upperLimit, lowerLimit: lowerLimit)
        self.textView.text = trimmedText
        self.activityIndicator.stopAnimating()
    }
}
