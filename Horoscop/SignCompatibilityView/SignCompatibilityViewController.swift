//
//  SignDetailedViewController.swift
//  Horoscop
//
//  Created by Voicu Narcis on 09/09/2017.
//  Copyright © 2017 Voicu Narcis. All rights reserved.
//

import UIKit

class SignCompatibilityViewController: UIViewController {

    @IBOutlet weak private var signImageView: UIImageView!
    @IBOutlet weak private var signNameLabel: UILabel!
    @IBOutlet weak private var signDateLabel: UILabel!
    @IBOutlet weak private var tableView: UITableView!
    
    fileprivate var signModel = SignModel()
    public var signProtocol: SignProtocol?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialSetup()
        setupUI()
        setupTableView()
    }
    
    // MARK: - Setup
    
    private func initialSetup() {
        signImageView.image = UIImage(named: (signProtocol?.getSignImage())!)
        signNameLabel.text = signProtocol?.getSignName()
        signDateLabel.text = signProtocol?.getSignDates()
    }
    
    private func setupUI() {
        view.backgroundColor = Colors.backgroundColor()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}

// MARK: - Extensions

extension SignCompatibilityViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension SignCompatibilityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return signModel.signs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SignCompatibilityTableViewCell.reuseIdentifier, for: indexPath) as! SignCompatibilityTableViewCell
        cell.setupCellData(signNames: signModel.signNames, signImages: signModel.signImages, indexPath: indexPath)
        return cell
    }
    
    
}
