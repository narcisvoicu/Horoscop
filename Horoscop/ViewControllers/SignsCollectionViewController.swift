//
//  ViewController.swift
//  Horoscop
//
//  Created by Voicu Narcis on 02/09/2017.
//  Copyright © 2017 Voicu Narcis. All rights reserved.
//

import UIKit

class SignsCollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let viewModel = SignCollectionViewModel()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupCollectionView()
    }
    
    // MARK: - Setup
    
    private func setupUI()  {
        //collectionView.backgroundColor = Colors.backgroundColor()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self;
        collectionView.dataSource = self;
    }
    
}

// MARK: - CollectionView Extensions

extension SignsCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedSign = viewModel.sign(at: indexPath)
        let signPreviewViewController = NavigationCoordinator.getSignPreview()
        let signPreviewViewModel = SignPreviewViewModel(sign: selectedSign)
        signPreviewViewController.viewModel = signPreviewViewModel
        navigationController?.pushViewController(signPreviewViewController, animated: true)
    }
}

extension SignsCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SignCollectionViewCell.reuseIdentifier, for: indexPath) as! SignCollectionViewCell
        
        let sign = viewModel.sign(at: indexPath)
        cell.setupCell(with: sign)

        return cell
    }
}

extension SignsCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.bounds.width / 3.5
        let cellHeight = collectionView.bounds.height / 4.5
        return CGSize(width: cellWidth, height: cellHeight)
    }
}

