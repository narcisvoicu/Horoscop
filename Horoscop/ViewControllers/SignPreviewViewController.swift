//
//  SignPreviewViewController.swift
//  Horoscop
//
//  Created by Voicu Narcis on 09/09/2017.
//  Copyright © 2017 Voicu Narcis. All rights reserved.
//

import UIKit
import SDWebImageSVGCoder

class SignPreviewViewController: UIViewController {
    
    @IBOutlet weak private var signImageView: UIImageView!
    @IBOutlet weak private var signNameLabel: UILabel!
    @IBOutlet weak var signDateLabel: UILabel!
    
    @IBOutlet weak private var todayButton: UIButton!
    @IBOutlet weak private var weekButton: UIButton!
    @IBOutlet weak var monthButton: UIButton!
    @IBOutlet weak private var yearButton: UIButton!
    
    var viewModel: SignPreviewViewModel?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupSigns()
    }
    
    // MARK: - IBActions
    
    @IBAction private func todayButtonAction(_ sender: UIButton) {
        viewModel?.loadHoroscope(horoscope: TodayHoroscope.self,
                                 horoscopeType: .today,
                                 completion: { (error, todayResult) in
                                 if let error = error {
                                     print("Error: \(error.localizedDescription)")
                                     return
                                 }
                                 guard let result = todayResult else {
                                     print("No error, no result")
                                     return
                                 }
                                 DispatchQueue.main.async {
                                     self.gotoNextPage(with: result)
                                 }
        })
    }
    @IBAction private func weekButtonAction(_ sender: UIButton) {
        viewModel?.loadHoroscope(horoscope: WeekHoroscope.self,
                                 horoscopeType: .week,
                                 completion: { (error, weekResult) in
                                 if let error = error {
                                     print("Error: \(error.localizedDescription)")
                                     return
                                 }
                                 guard let result = weekResult else {
                                     print("No error, no result")
                                     return
                                 }
                                 DispatchQueue.main.async {
                                     self.gotoNextPage(with: result)
                                 }
        })
    }
    @IBAction func monthButtonAction(_ sender: UIButton) {
        viewModel?.loadHoroscope(horoscope: MonthHoroscope.self,
                                 horoscopeType: .month,
                                 completion: { (error, monthResult) in
                                 if let error = error {
                                     print("Error: \(error.localizedDescription)")
                                     return
                                 }
                                 guard let result = monthResult else {
                                     print("No error, no result")
                                     return
                                 }
                                 DispatchQueue.main.async {
                                     self.gotoNextPage(with: result)
                                 }
        })
    }
    @IBAction private func annualButtonAction(_ sender: UIButton) {
        viewModel?.loadHoroscope(horoscope: YearHoroscope.self,
                                 horoscopeType: .year,
                                 completion: { (error, yearResult) in
                                 if let error = error {
                                     print("Error: \(error.localizedDescription)")
                                     return
                                 }
                                 guard let result = yearResult else {
                                     print("No error, no result")
                                     return
                                 }
                                 DispatchQueue.main.async {
                                     self.gotoNextPage(with: result)
                                 }
        })
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        //view.backgroundColor = Colors.backgroundColor()
        
        todayButton.backgroundColor = Colors.almostblack()
        weekButton.backgroundColor = Colors.darkGray()
        yearButton.backgroundColor = Colors.gray()
    }
    
    private func setupSigns() {
        guard let viewModel = viewModel, let sign = viewModel.sign else {
            return
        }
        signNameLabel.text = sign.signName
        signDateLabel.text = sign.signDate
        if let urlPath = Bundle.main.path(forResource: sign.signImageName, ofType: "svg") {
            let image = SDSVGImage(contentsOfFile: urlPath)
            signImageView.image = image
        }
    }
    
    // MARK: - Navigation
    
    private func gotoNextPage(with horoscope: Horoscope) {
        let signDetailsViewController = NavigationCoordinator.getSignDetails()
        guard let sign = viewModel?.sign else {
            return
        }
        let signDetailsViewModel = SignDetailsViewModel(horoscope: horoscope, sign: sign)
        signDetailsViewController.viewModel = signDetailsViewModel
        navigationController?.pushViewController(signDetailsViewController, animated: true)
    }

}
