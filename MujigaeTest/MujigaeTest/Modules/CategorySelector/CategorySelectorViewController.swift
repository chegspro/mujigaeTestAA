//
//  CategorySelectorViewController.swift
//  MujigaeTest
//
//  Created by Aslam Azis on 02/12/19.
//  Copyright © 2019 Aslam Azis. All rights reserved.
//

import UIKit
import MujigaeTestIO

class CategorySelectorViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btDone: BaseButton!
    
    var presenter: CategorySelectorPresenterProtocol?

    private var cellIdentifier = "CategorySelectorCell"
    private var layout: CategorySelectorFlowLayout = {
        let layout = CategorySelectorFlowLayout(minimumInteritemSpacing: 8, minimumLineSpacing: 8)
        return layout
    }()
    
    //MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    //MARK: - publics
    /*
    Add public functions here
    */

    //MARK: - IBActions
    /*
    Add IBActions in this area
    */
    
    @IBAction func btDoneTapped() {
        presenter?.didTapDone()
    }

    //MARK: - Privates
    private func setupViews() {
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        collectionView.collectionViewLayout = layout
    }
}

//MARK: - View Protocol
extension CategorySelectorViewController: CategorySelectorViewProtocol {
    func populateData() {
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }

    func showProgressDialog(show: Bool) {
        DispatchQueue.main.async {
            ProgressDialog.shared.show(show: show, view: self.view)
        }
    }

    func showError(message: String) {
        DispatchQueue.main.async { [weak self] in
            let emptyView = EmptyView()
            emptyView.setMessage(message)
            emptyView.delegate = self
            self?.collectionView.backgroundView = emptyView
        }
    }
    
    func hideError() {
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.backgroundView = UIView()
        }
    }
    
    func enableBTDone(_ enable: Bool) {
        btDone.isEnabled = enable
    }
}

//MARK: - UICollectionViewDataSource
extension CategorySelectorViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CategorySelectorCell
        cell.delegate = self
        guard let items = presenter?.items else {
            return cell
        }
        
        if indexPath.item < items.count {
            let item = items[indexPath.item]
            cell.setCategory(item)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.items.count ?? 0
    }
}

//MARK: - CategorySelectorCellDelegate
extension CategorySelectorViewController: CategorySelectorCellDelegate {
    func didToggleCategory(_ category: DishCategory, selected: Bool) {
        presenter?.didToggleCategory(category, selected: selected)
    }
}

//MARK: - EmptyViewDelegate
extension CategorySelectorViewController: EmptyViewDelegate {
    func didTapRetry() {
        presenter?.refetch()
    }
}
