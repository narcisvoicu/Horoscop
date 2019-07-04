//
//  WebViewController.swift
//  Horoscop
//
//  Created by Narcis Voicu on 10/07/2018.
//  Copyright © 2018 Voicu Narcis. All rights reserved.
//

import UIKit
import FirebaseDatabase
import CoreData

enum HoroscopeChoice: String {
    case daily = "daily"
    case profile = "profile"
    case annual = "annual"
    case compatibility = "compatibility"
}

class SignDetailsController: UIViewController {

    @IBOutlet weak fileprivate var textView: UITextView!
    @IBOutlet weak fileprivate var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak private var signInfoView: UIView!
    @IBOutlet weak private var signImageView: UIImageView!
    @IBOutlet weak private var signNameLabel: UILabel!
    @IBOutlet weak private var signDatesLabel: UILabel!
    @IBOutlet weak private var todayDateLabel: UILabel!
    
    public var horoscopeChoice: HoroscopeChoice?
    
    private var presenter: SignDetailedWebViewPresenter?
    fileprivate var errorViewController: ErrorViewController?
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var zodiacCoreData: ZodiacCoreData?
    private var coreDataContext: NSManagedObjectContext?
    
    /*
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        setupUI()
        setupFirebaseDatabase()
        
        //deleteEntriesFromEntity()
        //setupCoreData()
        if let choice = horoscopeChoice {
            loadText(by: choice)
        }
       
    }
    
    // MARK: - Setup
    
    private func initialSetup() {
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
        
        errorViewController = NavigationCoordinator.getErrorView() as? ErrorViewController
        
        presenter = SignDetailedWebViewPresenter(signProtocol: signProtocol)
    }
    
    // MARK: - Load Helper Functions
    
    private func loadText(by choice: HoroscopeChoice) {
        switch choice {
        case .daily:
          
        case .profile:
            // TODO: - enum for choice
            presenter?.makeFirebaseCall(choice: .profile,
                                        completion: { (text, isError, isTimeoutError) in
                                            self.activityIndicator.stopAnimating()
                                            guard let text = text else {
                                                return
                                            }
                                            if isError {
                                                self.errorViewController?.setErrorTexts(errorText: text,
                                                                                        imageName: ImageNames.whiteRobot,
                                                                                        textView: self.textView,
                                                                                        onParentViewController: self)
                                            } else if isTimeoutError {
                                                self.errorViewController?.setErrorTexts(errorText: ErrorConstants.timeoutError,
                                                                                        imageName: ImageNames.whiteNoInternet,
                                                                                        textView: self.textView,
                                                                                        onParentViewController: self)
                                            } else {
                                                self.textView.text = text
                                            }
            })
        case .annual:
            presenter?.makeFirebaseCall(choice: .annual,
                                        completion: { (text, isError, isTimeoutError) in
                                            self.activityIndicator.stopAnimating()
                                            guard let text = text else {
                                                return
                                            }
                                            if isError {
                                                self.errorViewController?.setErrorTexts(errorText: text,
                                                                                        imageName: ImageNames.whiteRobot,
                                                                                        textView: self.textView,
                                                                                        onParentViewController: self)
                                            } else if isTimeoutError{
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
     */
}


