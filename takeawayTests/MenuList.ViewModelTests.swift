//
//  MenuList.ViewModelTests.swift
//  takeawayTests
//
//  Created by Krzysztof Jankowski on 28/07/2021.
//

import Foundation
@testable import takeaway
import XCTest

class MenuListViewModelTests: XCTestCase {
    
    func testCallsGivenGroupingFunction() {
        //arrange
        var called = false
        let inputSection = [MenuSection.fixture()]
        let spyClosure: ([MenuItem]) -> [MenuSection] = { menu in
            called = true
            return inputSection
        }
        let viewModel = MenuList.ViewModel(menuFetching: MenuFetchingPlaceholder(), menuGrouping: spyClosure)
        
        //action
        let sections = viewModel.sections
        
        //assert
        // check that given closure was called
        XCTAssertTrue(called)
        // check that returned value was built with the closure
        XCTAssertEqual(sections, inputSection)
    }
    
    func testWhenFetchingStartsPublishesEmptyView() {
        // arrange
        let viewModel = MenuList.ViewModel(menuFetching: MenuFetchingPlaceholder())
        
        XCTAssertTrue(viewModel.sections.isEmpty)
    }
    
    func testWhenFetchingSucceedsPublishesSectionsBuiltFromReceivedMenuAndGivenGroupingClosure() {
        
    }
}
