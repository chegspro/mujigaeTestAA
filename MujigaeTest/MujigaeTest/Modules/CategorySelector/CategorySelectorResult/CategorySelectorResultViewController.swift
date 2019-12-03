//
//  CategorySelectorResultViewController.swift
//  MujigaeTest
//
//  Created by Aslam Azis on 03/12/19.
//  Copyright © 2019 Aslam Azis. All rights reserved.
//

import UIKit
import MujigaeTestIO

class CategorySelectorResultViewController: UIViewController, CategorySelectorResultViewProtocol {
    
    @IBOutlet weak var lbCategories: UILabel!
    
    var presenter: CategorySelectorResultPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        presenter?.viewDidLoad()
    }
    
    private func setupView() {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func populateData(categories: [DishCategory]) {
        lbCategories.text =
        """
        You selected :
        \(categories.map({ $0.name }).joined(separator: ", "))
        """
    }
    
}

