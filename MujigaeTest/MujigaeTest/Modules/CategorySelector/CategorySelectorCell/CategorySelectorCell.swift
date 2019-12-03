//
//  CategorySelectorCell.swift
//  MujigaeTest
//
//  Created by Aslam Azis on 03/12/19.
//  Copyright © 2019 Aslam Azis. All rights reserved.
//

import UIKit
import MujigaeTestIO

class CategorySelectorCell: UICollectionViewCell {
    
    @IBOutlet weak var btCategory: BaseButton!
    
    private var category: DishCategory?
    
    var delegate: CategorySelectorCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        return contentView.systemLayoutSizeFitting(CGSize(width: 1, height: 40))
    }

    func setCategory(_ category: DishCategory) {
        self.category = category
        btCategory.setTitle(category.name, for: .normal)
    }
    
    @IBAction func btCategoryTapped() {
        btCategory.isSelected = !btCategory.isSelected
        guard let category = self.category else {
            return
        }
        delegate?.didToggleCategory(category, selected: btCategory.isSelected)
    }
}

protocol CategorySelectorCellDelegate {
    func didToggleCategory(_ category: DishCategory, selected: Bool)
}
