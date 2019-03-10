//
//  ErrorViewController.swift
//  Horoscop
//
//  Created by Narcis Voicu on 23/07/2018.
//  Copyright © 2018 Voicu Narcis. All rights reserved.
//

import UIKit

class ErrorViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak private var errorImageView: UIImageView!
    @IBOutlet weak private var errorLabel: UILabel!
    @IBOutlet weak var dismissButton: UIButton!
    @IBAction private func dismissErrorView(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    public var errorText: String?
    public var errorImageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupErrorInfo()
        setupUI()
    }
    
    private func setupErrorInfo() {
        errorLabel.text = errorText
        errorImageView.image = UIImage(named: errorImageName!)?.imageWithInsets(insets: UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50))
    }
    
    private func setupUI() {
        containerView.layer.cornerRadius = 5
        errorImageView.layer.cornerRadius = errorImageView.frame.width / 2
        errorImageView.backgroundColor = Colors.errorViewRed()
        errorImageView.layer.masksToBounds = true
        errorImageView.bounds = CGRect()
        dismissButton.backgroundColor = Colors.errorViewRed()
        dismissButton.setTitleColor(UIColor.white, for: .normal)
    }
    
    public func setErrorTexts<T: UIViewController>(errorText: String, imageName: String, textView: UITextView, onParentViewController viewController: T) {
        self.errorText = errorText
        self.errorImageName = imageName
        modalPresentationStyle = .overCurrentContext
        textView.text = errorText
        viewController.present(self, animated: true, completion: nil)
    }

}

extension UIImage {
    func imageWithInsets(insets: UIEdgeInsets) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(
            CGSize(width: self.size.width + insets.left + insets.right,
                   height: self.size.height + insets.top + insets.bottom), false, self.scale)
        let _ = UIGraphicsGetCurrentContext()
        let origin = CGPoint(x: insets.left, y: insets.top)
        self.draw(at: origin)
        let imageWithInsets = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return imageWithInsets
    }
}
