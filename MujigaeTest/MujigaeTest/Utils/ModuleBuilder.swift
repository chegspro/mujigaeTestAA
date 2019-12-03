//
//  ModuleBuilder.swift
//  MujigaeTest
//
//  Created by Aslam Azis on 02/12/19.
//  Copyright © 2019 Aslam Azis. All rights reserved.
//

import UIKit
import MujigaeTestIO

class ModuleBuilder {
    
    static let shared = ModuleBuilder()
    
    private init() {}
    
    func createCategorySelectorVC(withNav: Bool) -> UIViewController {
        let view = CategorySelectorViewController()
        let router = CategorySelectorRouter()
        let interactor = CategorySelectorInteractor()
        let presenter = CategorySelectorPresenter(interface: view, interactor: interactor, router: router)
        router.viewController = view
        interactor.output = presenter
        view.presenter = presenter
        if withNav {
            return UINavigationController(rootViewController: view)
        }
        return view
    }
    
    func createCategorySelectionResultVC(selectedCategories: [DishCategory], withNav: Bool) -> UIViewController {
        let view = CategorySelectorResultViewController()
        let router = CategorySelectorResultRouter()
        let presenter = CategorySelectorResultPresenter(interface: view, router: router, selectedCategories: selectedCategories)
        router.viewController = view
        view.presenter = presenter
        if withNav {
            return UINavigationController(rootViewController: view)
        }
        return view
    }
    
}
