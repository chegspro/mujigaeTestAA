//
//  CategorySelectorContract.swift
//  MujigaeTest
//
//  Created by Aslam Azis on 02/12/19.
//  Copyright © 2019 Aslam Azis. All rights reserved.
//

import MujigaeTestIO

protocol CategorySelectorRouterProtocol: class {
    
    func showCategorySelectionResult(selected: [DishCategory])
    func exit(exitType: NavigationExitType, index: Int?, animated: Bool)

}

protocol CategorySelectorPresenterProtocol: class {

    var items: [DishCategory] { get }
    
    func viewDidLoad()
    func didToggleCategory(_ category: DishCategory, selected: Bool)
    func didTapDone()
    func refetch()
    func exit(exitType: NavigationExitType, index: Int?, animated: Bool)

}

protocol CategorySelectorInteractorOutputProtocol: class {
    
    func fetchCategoriesDidSuccess(items: [DishCategory])
    func fetchCategoriesDidFailed(message: String)
    
}

protocol CategorySelectorInteractorInputProtocol: class {
    
    var output: CategorySelectorInteractorOutputProtocol?  { get set }

    func fetchCategories()
    
}

protocol CategorySelectorViewProtocol: class {
    
    var presenter: CategorySelectorPresenterProtocol?  { get set }
    
    func populateData()
    func showProgressDialog(show: Bool)
    func showError(message: String)
    func hideError()
    func enableBTDone(_ enable: Bool)
    
}
