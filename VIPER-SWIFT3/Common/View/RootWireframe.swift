//
//  RootWireframe.swift
//  VIPER-SWIFT3
//
//  Created by Lun Sovathana on 12/12/16.
//  Copyright © 2016 Lun Sovathana. All rights reserved.
//

import UIKit

class RootWireframe{
    
    // Show Root ViewController
    func showRootViewController(_ viewController : UIViewController, inWindow : UIWindow){
        let nav = self.navigationControllerFromWindow(inWindow)
        nav.viewControllers = [viewController]
    }
    
    // Get Navigation from Window
    func navigationControllerFromWindow(_ window: UIWindow) -> UINavigationController{
        
        // Return navigation from window
        return window.rootViewController as! UINavigationController
    }
    
}

