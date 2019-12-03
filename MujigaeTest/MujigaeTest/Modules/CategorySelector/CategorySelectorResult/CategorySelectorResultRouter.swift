//
//  CategorySelectorResultRouter.swift
//  MujigaeTest
//
//  Created by Aslam Azis on 03/12/19.
//  Copyright © 2019 Aslam Azis. All rights reserved.
//

class CategorySelectorResultRouter: CategorySelectorResultRouterProtocol {
    
    weak var viewController: CategorySelectorResultViewController?
    
    //MARK: - Router Protocol
    func exit(exitType: NavigationExitType, index: Int? = -1, animated: Bool = true){
        viewController?.exit(exitType: exitType, index: index, animated: animated)
    }
    
}
