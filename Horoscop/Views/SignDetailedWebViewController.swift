//
//  WebViewController.swift
//  Horoscop
//
//  Created by Narcis Voicu on 10/07/2018.
//  Copyright © 2018 Voicu Narcis. All rights reserved.
//

import UIKit
import WebKit

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
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        setupUI()
        loadTheRightURL()
    }
    
    // MARK: - Setup
    
    private func initialSetup() {
        signImageView.image = UIImage(named: (signProtocol?.getSignImage())!)
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
    
    // MARK: - Load Helper Functions
    
    private func loadRequest(withURL url: String) {
        if let myUrl = URL(string: url) {
            let myRequest = URLRequest(url: myUrl)
            webView.navigationDelegate = self
            webView.load(myRequest)
            activityIndicator.startAnimating()
        }
    }
    
    private func loadTheRightURL() {
        switch horoscopeChoice {
        case .Daily?:
            guard let url = signProtocol?.getDailyHoroscope() else {
                return
            }
            loadRequest(withURL: url)
        case .Profile?:
            guard let url = signProtocol?.getSignProfile() else {
                return
            }
            loadRequest(withURL: url)
        case .Annual?:
            guard let url = signProtocol?.getAnnualHoroscope() else {
                return
            }
            loadRequest(withURL: url)
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
            populateTextView(byUpperLimit: HTMLLimits.daily["upperLimit"]!, lowerLimit: HTMLLimits.daily["lowerLimit"]!, html: html)
        case .Profile?:
            populateTextView(byUpperLimit: (signProtocol?.getSignDates())!, lowerLimit: HTMLLimits.profile["lowerLimit"]!, html: html)
        case .Annual?:
            populateTextView(byUpperLimit: HTMLLimits.annual["upperLimit"]!, lowerLimit: HTMLLimits.annual["lowerLimit"]!, html: html)
        case .Compatibility?:
            print("Compatibility")
        default:
            print("Error")
        }
    }
    
    private func populateTextView(byUpperLimit upperLimit: String, lowerLimit: String, html: Any) {
        let fullText = html as! String
        let trimmedText = HoroscopeTrimmer.getHoroscope(entireDescription: fullText, upperLimit: upperLimit, lowerLimit: lowerLimit)
        self.textView.text = trimmedText
        self.activityIndicator.stopAnimating()
    }
}
