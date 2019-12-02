//
//  BaseResult.swift
//  MujigaeTestIO
//
//  Created by Aslam Azis on 02/12/19.
//  Copyright © 2019 Aslam Azis. All rights reserved.
//

import Foundation

struct BaseResult {
    var status: ResultStatus
    var response: BaseResponse?
    var message: String
}

//MARK: - ResultStatus
enum ResultStatus {
    case success, noConnection, serverError
}
