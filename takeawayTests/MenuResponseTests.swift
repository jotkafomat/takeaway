//
//  MenuResponseTests.swift
//  takeawayTests
//
//  Created by Krzysztof Jankowski on 30/07/2021.
//

import Foundation
@testable import takeaway
import XCTest

class MenuResponseTests: XCTestCase {
    func testWhenDecodedFromJSONDataHasArrayOfValidMenuItems() throws {
        // Arrange
        let json = #"""
    {
        "items": [
            {
                "name": "spaghetti carbonara",
                "category": "pasta",
                "spicy": false,
                "price": 5.0
            },
            {
                "name": "penne all'arrabbiata",
                "category": "pasta",
                "spicy": true,
                "price": 5.5
            }
        ]
    }
    """#
        
        let data = try XCTUnwrap(json.data(using:.utf8))
        
        //Act
        let response = try JSONDecoder().decode(MenuResponse.self, from: data)
        //Assert
        XCTAssertNoThrow(try JSONDecoder().decode(MenuResponse.self, from: data))
        XCTAssertEqual(response.items.count, 2)
        
        let firstItem = try XCTUnwrap(response.items.first)
        
        XCTAssertEqual(firstItem.name, "spaghetti carbonara")
        XCTAssertEqual(firstItem.category, "pasta")
        XCTAssertEqual(firstItem.spicy, false)
        XCTAssertEqual(firstItem.price, 5.0)
        
        let secondItem = try XCTUnwrap(response.items.last)
        XCTAssertEqual(secondItem.name, "penne all'arrabbiata")
        XCTAssertEqual(secondItem.category, "pasta")
        XCTAssertEqual(secondItem.spicy, true)
        XCTAssertEqual(secondItem.price, 5.5)
    }
}
