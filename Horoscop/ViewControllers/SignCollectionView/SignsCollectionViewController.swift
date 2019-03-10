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
    
    fileprivate var signModel = SignModel()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Setup
    
    private func setupUI()  {
        collectionView.backgroundColor = Colors.backgroundColor()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self;
        collectionView.dataSource = self;
    }
    
}

// MARK: - CollectionView Extensions

extension SignsCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedSign = signModel.signs[indexPath.row];
        if let signPreviewVC = NavigationCoordinator.getSignPreview() as? SignPreviewViewController {
            signPreviewVC.signProtocol = SignFactory.getSign(sign: selectedSign)
            self.navigationController?.pushViewController(signPreviewVC, animated: true)
        }
    }
}

extension SignsCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return signModel.signs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SignCollectionViewCell.reuseIdentifier, for: indexPath) as! SignCollectionViewCell
        cell.setupCellData(signNames: signModel.signNames, signImages: signModel.signImages, indexPath: indexPath)
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

