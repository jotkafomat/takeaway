//
//  OrderTests.swift
//  takeawayTests
//
//  Created by Krzysztof Jankowski on 03/08/2021.
//

import Foundation
@testable import takeaway
import XCTest

class OrderTests: XCTestCase {
    
    func testTotalOrderCalculateFinalCosts() {
        //arrange
        let order = Order(items: [MenuItem.fixture(price: 1.0), MenuItem.fixture(price: 2.00)])
        
        //act
        let total = order.total
        
        //assert
        XCTAssertEqual(total, 3)
    }
}
