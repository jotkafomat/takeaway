//
//  menuGroupingTests.swift
//  menuGroupingTests
//
//  Created by Krzysztof Jankowski on 27/07/2021.
//

import XCTest
@testable import takeaway

class menuGroupingTests: XCTestCase {
    func testMenuWithManyCategoriesReturnsOneSectionPerCategoryInReverseAlphabethicalOrder() {
//        Arrange the input: a menu with many categories
        let menu = [
        MenuItem(name: "a pasta", category: "pastas"),
        MenuItem(name: "a drink", category: "drinks"),
        MenuItem(name: "another pasta", category: "pastas"),
        MenuItem(name: "a dessert", category: "desserts")
        ]
        let sections = groupMenuByCategory(menu)
        
        XCTAssertEqual(sections.count, 3)
        
        XCTAssertEqual(sections[0].category, "pastas")
        XCTAssertEqual(sections[1].category, "drinks")
        XCTAssertEqual(sections[2].category, "desserts")
    }
    
    
    func testMenuWithOneCategoryReturnsOneSection() throws {
//        Arrange the input: a menu with one Section
        let menu = [
            MenuItem(name: "name", category: "pastas"),
            MenuItem(name: "other name", category: "pastas")
        ]
//        Act on the SUT to get the output: the sections array
        let sections = groupMenuByCategory(menu)
//        Assert:
        XCTAssertEqual(sections.count, 1)
        let section = try XCTUnwrap(sections.first)
        
        XCTAssertEqual(section.items.count, 2)
        XCTAssertEqual(section.items.first?.name, "name")
        XCTAssertEqual(section.items.last?.name, "other name")
    }
    
    
    func testEmptyMenuReturnsEmptySections() {
//        Arrange the input: an empty menu
        let menu = [MenuItem]()
        
//        Act on the SUT to get the output: the sections array
        let sections = groupMenuByCategory(menu)
//        Assert:
        XCTAssertTrue(sections.isEmpty)
    }
}
