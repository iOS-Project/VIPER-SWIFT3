//
//  AddWireframe.swift
//  VIPER-SWIFT3
//
//  Created by Lun Sovathana on 12/13/16.
//  Copyright © 2016 Lun Sovathana. All rights reserved.
//

import UIKit

let AddTableViewControllerIdentifier = "AddTableViewController"

class AddWireframe{
    
    var addPresenter:AddPresenter?
    private var presentedViewController : UITableViewController?
    
    func presentAddInterfaceFromViewController(_ viewController : UIViewController){
        let newVC = addTableViewController()
        newVC.eventHandler = addPresenter
        addPresenter!.addModuleDelegate = newVC
        presentedViewController = newVC
        viewController.navigationController?.pushViewController(newVC, animated: true)
    }
    
    func dismissAddInterface(){
        _ = presentedViewController?.navigationController?.popViewController(animated: true)
    }
    
    private func addTableViewController() -> AddTableViewController{
        let storyboard = mainStoryboard()
        let vc = storyboard.instantiateViewController(withIdentifier: AddTableViewControllerIdentifier) as! AddTableViewController
        return vc
    }
    
    private func mainStoryboard() -> UIStoryboard{
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
}
