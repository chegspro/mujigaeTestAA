//
//  CategorySelectorResultContract.swift
//  MujigaeTest
//
//  Created by Aslam Azis on 03/12/19.
//  Copyright © 2019 Aslam Azis. All rights reserved.
//

import Foundation
import MujigaeTestIO

protocol CategorySelectorResultRouterProtocol: class {
    
    func exit(exitType: NavigationExitType, index: Int?, animated: Bool)
    
}

protocol CategorySelectorResultPresenterProtocol: class {
    
    func viewDidLoad()
    func exit(exitType: NavigationExitType, index: Int?, animated: Bool)
    
}

protocol CategorySelectorResultViewProtocol: class {
    
    var presenter: CategorySelectorResultPresenterProtocol?  { get set }
    
    func populateData(categories: [DishCategory])
    
}
