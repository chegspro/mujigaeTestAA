//
//  CategorySelectorRouter.swift
//  MujigaeTest
//
//  Created by Aslam Azis on 02/12/19.
//  Copyright © 2019 Aslam Azis. All rights reserved.
//

import MujigaeTestIO

class CategorySelectorRouter: CategorySelectorRouterProtocol {
    
    weak var viewController: CategorySelectorViewController?

    /*
     MARK: RouterProtocol
     */
    func exit(exitType: NavigationExitType, index: Int? = -1, animated: Bool = true){
        viewController?.exit(exitType: exitType, index: index, animated: animated)
    }
    
    func showCategorySelectionResult(selected: [DishCategory]) {
        let view = ModuleBuilder.shared.createCategorySelectionResultVC(selectedCategories: selected, withNav: false)
        viewController?.navigationController?.pushViewController(view, animated: true)
    }
}
