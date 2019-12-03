//
//  CategorySelectorPresenter.swift
//  MujigaeTest
//
//  Created by Aslam Azis on 02/12/19.
//  Copyright © 2019 Aslam Azis. All rights reserved.
//

import Foundation
import MujigaeTestIO

class CategorySelectorPresenter: CategorySelectorPresenterProtocol {
    
    weak private var view: CategorySelectorViewProtocol?
    private let interactor: CategorySelectorInteractorInputProtocol?
    private let router: CategorySelectorRouterProtocol?

    var items: [DishCategory]
    
    private var selectedCategories: [DishCategory]
    private let minSelectedCategories = 3
    
    init(interface: CategorySelectorViewProtocol,
         interactor: CategorySelectorInteractorInputProtocol?,
         router: CategorySelectorRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
        self.items = []
        self.selectedCategories = []
    }
    
    private func fetchData() {
        view?.showProgressDialog(show: true)
        view?.hideError()
        interactor?.fetchCategories()
    }
    
    private func checkSelectedCategories() {
        view?.enableBTDone(selectedCategories.count >= minSelectedCategories)
    }
    
    //MARK: - PresenterProtocol
    func viewDidLoad() {
        fetchData()
    }
    
    func didToggleCategory(_ category: DishCategory, selected: Bool) {
        if selected {
            if !selectedCategories.contains(category) {
                selectedCategories.append(category)
            }
        } else {
            selectedCategories.removeAll(where: { $0 == category })
        }
        checkSelectedCategories()
    }
    
    func didTapDone() {
        router?.showCategorySelectionResult(selected: selectedCategories)
    }
    
    func refetch() {
        fetchData()
    }

    func exit(exitType: NavigationExitType, index: Int? = -1, animated: Bool = true) {
        router?.exit(exitType: exitType, index: index, animated: animated)
    }

}

//MARK: - InteractorOutputProtocol
extension CategorySelectorPresenter: CategorySelectorInteractorOutputProtocol {
    
    func fetchCategoriesDidSuccess(items: [DishCategory]) {
        self.items = items
        view?.showProgressDialog(show: false)
        view?.populateData()
        view?.hideError()
    }

    func fetchCategoriesDidFailed(message: String) {
        view?.showProgressDialog(show: false)
        view?.showError(message: message)
    }

}
