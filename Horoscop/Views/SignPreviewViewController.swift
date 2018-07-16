//
//  SignPreviewViewController.swift
//  Horoscop
//
//  Created by Voicu Narcis on 09/09/2017.
//  Copyright © 2017 Voicu Narcis. All rights reserved.
//

import UIKit

class SignPreviewViewController: UIViewController {

    @IBOutlet weak private var signInformationView: UIView!
    @IBOutlet weak private var actionsView: UIView!
    
    @IBOutlet weak private var signImageView: UIImageView!
    @IBOutlet weak private var signNameLabel: UILabel!
    
    @IBOutlet weak private var todayButton: UIButton!
    @IBOutlet weak private var profileButton: UIButton!
    @IBOutlet weak private var yearButton: UIButton!
    @IBOutlet weak private var compatibilityButton: UIButton!
    
    public var signProtocol: SignProtocol?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupSigns()
    }
    
    // MARK: - IBActions
    
    @IBAction private func todayButtonAction(_ sender: UIButton) {
        gotoNextPage(withChoice: .Daily)
    }
    @IBAction private func profileButtonAction(_ sender: UIButton) {
        gotoNextPage(withChoice: .Profile)
    }
    @IBAction private func annualButtonAction(_ sender: UIButton) {
        gotoNextPage(withChoice: .Annual)
    }
    @IBAction private func compatibilityButtonAction(_ sender: UIButton) {
        if let signCompatibilityVC = NavigationCoordinator.getSignCompatibility() as? SignCompatibilityViewController {
            signCompatibilityVC.signProtocol = signProtocol
            self.navigationController?.pushViewController(signCompatibilityVC, animated: true)
        }
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        view.backgroundColor = Colors.backgroundColor()
        signInformationView.backgroundColor = UIColor.clear
        actionsView.backgroundColor = UIColor.clear
        
        todayButton.backgroundColor = Colors.almostblack()
        profileButton.backgroundColor = Colors.darkGray()
        yearButton.backgroundColor = Colors.gray()
        compatibilityButton.backgroundColor = Colors.lightGray()
    }
    
    private func setupSigns() {
        signImageView.image = UIImage(named: (signProtocol?.getSignImage())!)
        signNameLabel.text = signProtocol?.getSignName()
    }
    
    // MARK: - Navigation helper
    
    private func gotoNextPage(withChoice horoscopeChoice: HoroscopeChoice) {
        if let webViewController = NavigationCoordinator.getSignDetailedWebView() as? SignDetailedWebViewController {
            webViewController.signProtocol = signProtocol
            webViewController.horoscopeChoice = horoscopeChoice
            self.navigationController?.pushViewController(webViewController, animated: true)
        }
    }

}
