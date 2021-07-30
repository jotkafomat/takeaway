//
//  MenuItemTests.swift
//  takeawayTests
//
//  Created by Krzysztof Jankowski on 30/07/2021.
//

import Foundation
@testable import takeaway
import XCTest

class MenuItemTests: XCTestCase {
    func testWhenDecodedFromJsonDataHasAllTheInputProperties() throws {
        //arrange the JSON Data input
        let json = #"{ "name": "a name", "category": "a category", "spicy": true, "price": 1.00 }"#
        
        let data = try XCTUnwrap(json.data(using: .utf8))
        
        let item = try JSONDecoder().decode(MenuItem.self, from: data)
        
        XCTAssertEqual(item.name, "a name")
        XCTAssertEqual(item.category, "a category")
        XCTAssertEqual(item.spicy, true)
        XCTAssertEqual(item.price, 1.00)
    }
}
