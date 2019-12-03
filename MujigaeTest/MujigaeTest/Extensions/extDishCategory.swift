//
//  extDishCategory.swift
//  MujigaeTest
//
//  Created by Aslam Azis on 03/12/19.
//  Copyright © 2019 Aslam Azis. All rights reserved.
//

import MujigaeTestIO

extension DishCategory: Equatable {
    public static func == (lhs: DishCategory, rhs: DishCategory) -> Bool {
        return lhs.id == rhs.id
    }
}
