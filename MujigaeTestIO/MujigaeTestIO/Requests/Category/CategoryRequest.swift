//
//  CategoryRequest.swift
//  MujigaeTestIO
//
//  Created by Aslam Azis on 02/12/19.
//  Copyright © 2019 Aslam Azis. All rights reserved.
//

public class CategoryRequest: BaseRequest {
    
    public typealias DataResponse = DishCategory
    
    public init() {}
    
    public func getAllCategories(completion: @escaping (Bool, [DataResponse]?, String) -> Void ) {
        let path = "/getCategory.php"
        request(path: path, method: .GET) { (result) in
            if let response = result.response as? ArrayResponse<DataResponse>, let categories = response.data {
                completion(true, categories, result.message)
            } else {
                completion(false, nil, result.message)
            }
        }
    }
    
}
