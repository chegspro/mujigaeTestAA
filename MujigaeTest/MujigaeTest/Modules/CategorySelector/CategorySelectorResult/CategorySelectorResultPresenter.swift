//
//  CategorySelectorResultPresenter.swift
//  MujigaeTest
//
//  Created by Aslam Azis on 03/12/19.
//  Copyright © 2019 Aslam Azis. All rights reserved.
//

import MujigaeTestIO

class CategorySelectorResultPresenter {
    
    weak private var view: CategorySelectorResultViewProtocol?
    private let router: CategorySelectorResultRouterProtocol?
    
    private var items: [DishCategory]
    
    init(interface: CategorySelectorResultViewProtocol,
         router: CategorySelectorResultRouterProtocol,
         selectedCategories: [DishCategory]) {
        self.view = interface
        self.router = router
        self.items = selectedCategories
    }
    
}

extension CategorySelectorResultPresenter: CategorySelectorResultPresenterProtocol {
    func viewDidLoad() {
        view?.populateData(categories: items)
    }
    
    func exit(exitType: NavigationExitType, index: Int?, animated: Bool) {
        router?.exit(exitType: exitType, index: index, animated: animated)
    }
    
}
