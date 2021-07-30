//
//  MenuList.ViewModelTests.swift
//  takeawayTests
//
//  Created by Krzysztof Jankowski on 28/07/2021.
//

import Foundation
@testable import takeaway
import XCTest
import Combine

class MenuListViewModelTests: XCTestCase {
    
    var cancellable = Set<AnyCancellable>()
    
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
        //arrange
        var receivedMenu: [MenuItem]?
        let expectedSections = [MenuSection.fixture()]
        let spyClosure: ([MenuItem]) -> [MenuSection] = { menu in
            receivedMenu = menu
            return expectedSections
        }
        let expectedMenu = [MenuItem.fixture()]
        let menuFetchingStub = MenuFetchingStub(returning: .success(expectedMenu))
        let viewModel = MenuList.ViewModel(menuFetching: menuFetchingStub, menuGrouping: spyClosure)
        //assert
        let expectation = XCTestExpectation(description: "Publishes section built from received menu and given grouping closure")
        //act
        viewModel
            .$sections
            .dropFirst()
            .sink { value in
                //ensure the grouping closure is called with the received menu
                XCTAssertEqual(receivedMenu, expectedMenu)
                //ensure the publish value is the result of the grouping closure
                XCTAssertEqual(value, expectedSections)
                expectation.fulfill()
            }
            .store(in: &cancellable)
        wait(for: [expectation], timeout: 1)
    }
}
