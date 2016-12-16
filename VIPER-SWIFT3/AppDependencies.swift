//
//  AppDependencies.swift
//  VIPER-SWIFT3
//
//  Created by Lun Sovathana on 12/14/16.
//  Copyright © 2016 Lun Sovathana. All rights reserved.
//

import UIKit

class AppDependency{
    
    var listWireFrame = ListWireframe()
    
    init() {
        configureDependencies()
    }
    
    // Install RootViewController
    func installRootViewControllerIntoWindow(_ window: UIWindow){
        listWireFrame.presentListTableViewFromWindow(window)
    }
    
    // Configure Dependency
    func configureDependencies(){
        let rootWireframe = RootWireframe()
        let listPresenter = ListPresenter()
        let listInteractor = ListInterator()
        
        let addWireframe = AddWireframe()
        let addPresenter = AddPresenter()
        let addInteractor = AddInteractor()
        
        listPresenter.listInteractor = listInteractor
        listPresenter.listViewProtocol = listWireFrame.listTableViewController
        listPresenter.listWireframe = listWireFrame
        
        listInteractor.listInteractorOutput = listPresenter
        
        listWireFrame.listPresenter = listPresenter
        listWireFrame.rootWireframe = rootWireframe
        listWireFrame.addWireframe = addWireframe
        
        addPresenter.addInteractorInput = addInteractor
        addPresenter.addWireframe = addWireframe
        
        addWireframe.addPresenter = addPresenter
        
        addInteractor.out = addPresenter
        
    }
}

