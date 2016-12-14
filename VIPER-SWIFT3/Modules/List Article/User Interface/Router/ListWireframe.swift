//
//  ListWireframe.swift
//  VIPER-SWIFT3
//
//  Created by Lun Sovathana on 12/12/16.
//  Copyright © 2016 Lun Sovathana. All rights reserved.
//

import Foundation
import UIKit

let ListTableViewControllerIdentifier = "ListTableViewController"

class ListWireframe: NSObject{
    
    // RootWireframe
    var rootWireframe           : RootWireframe?
    
    // AddWireframe
    var addWireframe            : AddWireframe?
    
    // ListPresenter
    var listPresenter           : ListPresenter?
    
    // ListTableViewController
    var listTableViewController : ListTableViewController?
    
    // Present ListTableView
    func presentListTableViewFromWindow(_ window:UIWindow){
        let viewController = listTableViewFromStoryboard()
        viewController.eventHandler = listPresenter
        listTableViewController = viewController
        listPresenter?.listViewProtocol = viewController
        
        // Show Root ViewController
        rootWireframe!.showRootViewController(listTableViewController!, inWindow: window)
    }
    
    func presentAddInterface(){
        // Show Add Interface here
    }
    
    private func listTableViewFromStoryboard() -> ListTableViewController{
        let storyboard = mainStoryboard()
        let vc = storyboard.instantiateViewController(withIdentifier: ListTableViewControllerIdentifier) as! ListTableViewController
        return vc
    }
    
    private func mainStoryboard() -> UIStoryboard{
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
}
