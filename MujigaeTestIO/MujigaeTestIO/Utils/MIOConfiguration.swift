//
//  MIOConfiguration.swift
//  MujigaeTestIO
//
//  Created by Aslam Azis on 02/12/19.
//  Copyright © 2019 Aslam Azis. All rights reserved.
//

import Foundation

public class MIOConfiguration {
    public static let shared = MIOConfiguration()
    
    public var logEnabled = false
    public var baseURL = ""
    public var timeoutRequestInterval: TimeInterval = 15
    public var timeoutResponseInterval: TimeInterval = 20
    
    private init(){}
}
