//
//  BaseResponse.swift
//  MujigaeTestIO
//
//  Created by Aslam Azis on 02/12/19.
//  Copyright © 2019 Aslam Azis. All rights reserved.
//

import Foundation

public protocol BaseResponse {
    
    var status: Bool { get set }
    var message: String { get set }
    
}

public class ObjectResponse<T: Codable> : BaseResponse, Codable {
    
    public var status: Bool
    public var data: T?
    public var message: String
    
}

public class ArrayResponse<T: Codable> : BaseResponse, Codable {
    
    public var status: Bool
    public var data: [T]?
    public var message: String
    
}

public class ErrorResponse : BaseResponse, Codable {
    
    public var status: Bool
    public var message: String
    
}
