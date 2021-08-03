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
        let order = Order(items: [MenuItem.fixture(), MenuItem.fixture()])
        
        //act
        let total = order.total
        
        //assert
        XCTAssertEqual(total, 2)
    }
}
