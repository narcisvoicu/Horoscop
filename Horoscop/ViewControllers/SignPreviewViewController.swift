//
//  SignPreviewViewController.swift
//  Horoscop
//
//  Created by Voicu Narcis on 09/09/2017.
//  Copyright © 2017 Voicu Narcis. All rights reserved.
//

import UIKit

class SignPreviewViewController: UIViewController {
    
    @IBOutlet weak private var signImageView: UIImageView!
    @IBOutlet weak private var signNameLabel: UILabel!
    @IBOutlet weak var signDateLabel: UILabel!
    
    @IBOutlet weak private var todayButton: UIButton!
    @IBOutlet weak private var weekButton: UIButton!
    @IBOutlet weak var monthButton: UIButton!
    @IBOutlet weak private var yearButton: UIButton!
    @IBOutlet weak private var compatibilityButton: UIButton!
    
    var currentSign: Sign?
    
    private lazy var service: HoroscopeService? = {
        guard let sign = currentSign else {
            return nil
        }
        return HoroscopeService(sign: sign)
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupSigns()
    }
    
    // MARK: - IBActions
    
    @IBAction private func todayButtonAction(_ sender: UIButton) {
        service?.getTodayHoroscope(completion: { (error, result) in
            if let error = error {
                print("Error: \(error)")
            }
            
            if let result = result {
                print("result: \(result)")
            } else {
                print("empty result")
            }
        })
      //  gotoNextPage(withChoice: .daily)
    }
    @IBAction private func weekButtonAction(_ sender: UIButton) {
        gotoNextPage(withChoice: .profile)
    }
    @IBAction func monthButtonAction(_ sender: UIButton) {
    }
    @IBAction private func annualButtonAction(_ sender: UIButton) {
        gotoNextPage(withChoice: .annual)
    }
    @IBAction private func compatibilityButtonAction(_ sender: UIButton) {
        let signCompatibilityVC = NavigationCoordinator.getSignCompatibility()
        navigationController?.pushViewController(signCompatibilityVC, animated: true)
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        view.backgroundColor = Colors.backgroundColor()
        
        todayButton.backgroundColor = Colors.almostblack()
        weekButton.backgroundColor = Colors.darkGray()
        yearButton.backgroundColor = Colors.gray()
        compatibilityButton.backgroundColor = Colors.lightGray()
    }
    
    private func setupSigns() {
        signNameLabel.text = currentSign?.signName
        signDateLabel.text = currentSign?.signDate
        guard let signImageName = currentSign?.signImageName else {
            return
        }
        signImageView.image = UIImage(named: signImageName)
    }
    
    // MARK: - Navigation helper
    
    private func gotoNextPage(withChoice horoscopeChoice: HoroscopeChoice) {
        let webViewController = NavigationCoordinator.getSignDetailedWebView()
        webViewController.horoscopeChoice = horoscopeChoice
        navigationController?.pushViewController(webViewController, animated: true)
    }

}
