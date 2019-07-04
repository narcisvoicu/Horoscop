//
//  NavigationViewController.swift
//  Horoscop
//
//  Created by Voicu Narcis on 09/09/2017.
//  Copyright © 2017 Voicu Narcis. All rights reserved.
//

import UIKit

class NavigationCoordinator: NSObject {
    
    // MARK: - Get storyboard
    
    static func getMainStoryboard() -> UIStoryboard {
        return UIStoryboard.init(name: "Main", bundle: nil)
    }
    
    // MARK: - Get view controllers
    
    static func getSignCollectionView() -> SignsCollectionViewController {
        return getMainStoryboard().instantiateViewController(withIdentifier: "SignCollectionView") as! SignsCollectionViewController
    }
    
    static func getSignPreview() -> SignPreviewViewController {
        return getMainStoryboard().instantiateViewController(withIdentifier: "SignPreview") as! SignPreviewViewController
    }
    
    static func getSignCompatibility() -> SignCompatibilityViewController {
        return getMainStoryboard().instantiateViewController(withIdentifier: "SignCompatibility") as! SignCompatibilityViewController
    }
    
    static func getSignDetailedCompatibility() -> SignDetailedCompatibilityViewController {
        return getMainStoryboard().instantiateViewController(withIdentifier: "SignDetailedCompatibility") as! SignDetailedCompatibilityViewController
    }
    
    static func getSignDetailedWebView() -> SignDetailsController {
        return getMainStoryboard().instantiateViewController(withIdentifier: "SignDetailedWebView") as! SignDetailsController
    }
    
    static func getErrorView() -> UIViewController {
        return ErrorViewController(nibName: "ErrorViewController", bundle: nil)
    }
}
