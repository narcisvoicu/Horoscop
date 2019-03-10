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
import CoreData

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
    
    private var signDetailedWebViewPresenter: SignDetailedWebViewPresenter?
    fileprivate var errorViewController: ErrorViewController?
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var zodiacCoreData: ZodiacCoreData?
    private var coreDataContext: NSManagedObjectContext?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        setupUI()
        setupFirebaseDatabase()
        //deleteEntriesFromEntity()
        //setupCoreData()
        loadTextByChoice()
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
        guard let signProtocol = signProtocol else {
            textView.text = ErrorConstants.normalError
            return
        }
        
        errorViewController = NavigationCoordinator.getErrorView() as? ErrorViewController
        
        signDetailedWebViewPresenter = SignDetailedWebViewPresenter(signProtocol: signProtocol)
    }
    
    // MARK: - Load Helper Functions
    
    // TODO: - maybe a protocol inside presenter for this method
    
    private func loadRequest(withURL url: String) {
        if let myUrl = URL(string: url) {
            let myRequest = URLRequest(url: myUrl)
            webView.navigationDelegate = self
            webView.load(myRequest)
            activityIndicator.startAnimating()
        }
    }
    
    private func loadTextByChoice() {
        switch horoscopeChoice {
        case .Daily?:
            guard let url = signProtocol?.getDailyHoroscope() else {
                return
            }
            loadRequest(withURL: url)
        case .Profile?:
            // TODO: - enum for choice
            signDetailedWebViewPresenter?.makeFirebaseCall(choice: "profile",
                                                           completion: { (text, isError) in
                                                            self.activityIndicator.stopAnimating()
                                                            guard let text = text else {
                                                                return
                                                            }
                                                            if isError {
                                                                self.errorViewController?.setErrorTexts(errorText: ErrorConstants.timeoutError,
                                                                                                        imageName: ImageNames.whiteNoInternet,
                                                                                                        textView: self.textView,
                                                                                                        onParentViewController: self)
                                                            } else {
                                                                self.textView.text = text
                                                            }
            })
        case .Annual?:
            signDetailedWebViewPresenter?.makeFirebaseCall(choice: "annual",
                                                           completion: { (text, isError) in
                                                            self.activityIndicator.stopAnimating()
                                                            guard let text = text else {
                                                                return
                                                            }
                                                            if isError {
                                                                self.errorViewController?.setErrorTexts(errorText: ErrorConstants.timeoutError,
                                                                                                        imageName: ImageNames.whiteNoInternet,
                                                                                                        textView: self.textView,
                                                                                                        onParentViewController: self)
                                                            } else {
                                                                self.textView.text = text
                                                            }
            })
        default:
            print("altceva")
        }
    }
    
    /// TODO: - Check if CoreData works correctly
    ///       - Think were to put these methods (maybe inside presenter)
    ///       - Think of creating a separate layer for persistency (it will be used in other parts of the code too - probably)
    
//    private func setupCoreData() {
//        coreDataContext = appDelegate.persistentContainer.viewContext
//        guard let context = coreDataContext else {
//            return
//        }
//        zodiacCoreData = ZodiacCoreData(context: context)
//    }
//
//    fileprivate func saveDailyToCoreData(dailyHoroscope: String) {
//        if !entityInstanceExists(instanceName: (signProtocol?.getSignName())!) {
//            guard let context = coreDataContext else {
//                return
//            }
//            let signCoreData = SignCoreData(context: context)
//            signCoreData.daily = dailyHoroscope
//            signCoreData.name = signProtocol?.getSignName()
//            zodiacCoreData?.addToZodiac(signCoreData)
//        }
//
//        do {
//            try coreDataContext?.save()
//        } catch {
//            print("Saving failed")
//        }
//    }
//
//    fileprivate func entityInstanceExists(instanceName: String) -> Bool {
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SignCoreData")
//        fetchRequest.predicate = NSPredicate(format: "name = %@", (signProtocol?.getSignName())!)
//        var results = [NSManagedObject]()
//        do {
//            results = try coreDataContext?.fetch(fetchRequest) as! [NSManagedObject]
//        } catch {
//            print("error fetching objects")
//        }
//
//        return results.count > 0
//    }
//
//    fileprivate func fetchCoreData() -> String {
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SignCoreData")
//        fetchRequest.predicate = NSPredicate(format: "name = %@", (signProtocol?.getSignName())!)
//        fetchRequest.returnsObjectsAsFaults = false
//        do {
//            let result = try coreDataContext?.fetch(fetchRequest)
//            print("Result core data: \(result)")
//            for data in result as! [NSManagedObject] {
//                guard let dailyHoroscope = data.value(forKey: "daily") as? String else {
//                    return "Failed"
//                }
//                print("Core data daily: \(dailyHoroscope)")
//                return dailyHoroscope
//            }
//        } catch {
//            return "Failed"
//        }
//        return "Failed"
//    }
//
//    private func deleteEntriesFromEntity() {
//        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "SignCoreData")
//        let request = NSBatchDeleteRequest(fetchRequest: fetch)
//        do {
//            try coreDataContext?.execute(request)
//        } catch {
//            print("delete completed with errors")
//        }
//    }
    
}

// MARK: - Extensions

extension SignDetailedWebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.evaluateJavaScript("document.documentElement.innerText") { (html, error) in
            self.showTextByChoice(withHTML: html ?? "None")
        }
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        errorViewController?.setErrorTexts(errorText: ErrorConstants.normalError, imageName: ImageNames.whiteRobot, textView: textView, onParentViewController: self)
        activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("Webview error: \(error.localizedDescription)")
        errorViewController?.setErrorTexts(errorText: ErrorConstants.normalError, imageName: ImageNames.whiteRobot, textView: textView, onParentViewController: self)
        showTextByChoice(withHTML: "None")
        activityIndicator.stopAnimating()
    }
    
    private func showTextByChoice(withHTML html: Any) {
        switch horoscopeChoice {
        case .Daily?:
            populateTextView(byUpperLimit: HTMLLimits.dailyUpperLimit, lowerLimit: HTMLLimits.dailyLowerLimit, html: html)
        default:
            //textView.text = fetchCoreData()
            print("default")
        }
    }
    
    private func populateTextView(byUpperLimit upperLimit: String, lowerLimit: String, html: Any) {
        guard let fullText = html as? String else {
            textView.text = ErrorConstants.showTextError
            return
        }
        let trimmedText = HoroscopeTrimmer.getHoroscope(entireDescription: fullText, upperLimit: upperLimit, lowerLimit: lowerLimit)
        
//        saveDailyToCoreData(dailyHoroscope: trimmedText)
//
//        self.textView.text = fetchCoreData()
        
        textView.text = trimmedText
        
        self.activityIndicator.stopAnimating()
    }
    
    
}

