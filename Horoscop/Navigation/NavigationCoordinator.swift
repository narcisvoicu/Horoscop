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
    
    static func getSignCollectionView() -> UIViewController {
        return getMainStoryboard().instantiateViewController(withIdentifier: "SignCollectionView")
    }
    
    static func getSignPreview() -> UIViewController {
        return getMainStoryboard().instantiateViewController(withIdentifier: "SignPreview")
    }
    
    static func getSignCompatibility() -> UIViewController {
        return getMainStoryboard().instantiateViewController(withIdentifier: "SignCompatibility")
    }
    
    static func getSignDetailedWebView() -> UIViewController {
        return getMainStoryboard().instantiateViewController(withIdentifier: "SignDetailedWebView")
    }
}
