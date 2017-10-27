//
//  ViewController.swift
//  Horoscop
//
//  Created by Voicu Narcis on 02/09/2017.
//  Copyright © 2017 Voicu Narcis. All rights reserved.
//

import UIKit

class SignsCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
   
    @IBOutlet weak var collectionView: UICollectionView!
    
    var signs = [Sign]()
    var signNames = [String]()
    var signImages = [String]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupSigns()
        setupCollectionView()
      //  self.navigationController?.navigationBar.backgroundColor = UIColor.clear
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Setup
    
    func setupUI()  {
        collectionView.backgroundColor = UIColor(patternImage: UIImage(named: "wallpaperHoroscop4")!)
    }
    
    func setupSigns() {
        signs.append(Sign(signName: .Aries))
        signs.append(Sign(signName: .Taurus))
        signs.append(Sign(signName: .Gemini))
        signs.append(Sign(signName: .Cancer))
        signs.append(Sign(signName: .Leo))
        signs.append(Sign(signName: .Virgo))
        signs.append(Sign(signName: .Libra))
        signs.append(Sign(signName: .Scorpio))
        signs.append(Sign(signName: .Sagittarius))
        signs.append(Sign(signName: .Scorpio))
        signs.append(Sign(signName: .Aquarius))
        signs.append(Sign(signName: .Pisces))
        
        for sign in signs {
            signNames.append(SignFactory.getSign(sign: sign).getSignName())
            signImages.append(SignFactory.getSign(sign: sign).getSignImage())
        }
    }
    
    func setupCollectionView() {
        collectionView.delegate = self;
        collectionView.dataSource = self;
    }

    // MARK: - Collection View Delegate Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return signs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell: SignCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SignCell", for: indexPath) as! SignCollectionViewCell
        cell.signNameLabel.text = signNames[indexPath.row]
        cell.signImageView.image = UIImage(named: signImages[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedSign = signs[indexPath.row];
        print("Selected sign: \(SignFactory.getSign(sign: selectedSign).getSignName())")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.bounds.width / 3.5
        let cellHeight = collectionView.bounds.height / 4.5
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
}

