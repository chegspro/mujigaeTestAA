//
//  CategorySelectorInteractor.swift
//  MujigaeTest
//
//  Created Aslam Azis on 02/12/19.
//  Copyright © 2019 Aslam Azis. All rights reserved.
//

import MujigaeTestIO

class CategorySelectorInteractor: CategorySelectorInteractorInputProtocol {
    
    weak var output: CategorySelectorInteractorOutputProtocol?
    
    func fetchCategories() {
        CategoryRequest().getAllCategories { [weak self] (success, response, message) in
            if success, let categories = response {
                self?.output?.fetchCategoriesDidSuccess(items: categories)
            } else {
                self?.output?.fetchCategoriesDidFailed(message: message)
            }
        }
    }
    
}
