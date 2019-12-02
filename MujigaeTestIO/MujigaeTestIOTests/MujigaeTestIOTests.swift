//
//  MujigaeTestIOTests.swift
//  MujigaeTestIOTests
//
//  Created by Aslam Azis on 02/12/19.
//  Copyright © 2019 Aslam Azis. All rights reserved.
//

import XCTest
@testable import MujigaeTestIO

class MujigaeTestIOTests: XCTestCase {

    override func setUp() {
        MIOConfiguration.shared.baseURL = "http://188.166.224.83/mujigae"
        MIOConfiguration.shared.logEnabled = true
    }

    func testGetAllCategories() {
        let expect = expectation(description: "getAllCategories")
        var categories: [DishCategory]?
        CategoryRequest().getAllCategories { (status, data, message) in
            if status, let data = data {
                categories = data
                expect.fulfill()
            }
        }
        waitForExpectations(timeout: 100, handler: nil)
        XCTAssertNotNil(categories)
    }
}
