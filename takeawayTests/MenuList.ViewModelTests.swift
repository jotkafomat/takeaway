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
    
    func testCallsGivenGroupingFunction() throws {
        //arrange
        var called = false
        let inputSection = [MenuSection.fixture()]
        let spyClosure: ([MenuItem]) -> [MenuSection] = { menu in
            called = true
            return inputSection
        }
        let viewModel = MenuList.ViewModel(menuFetching: MenuFetchingStub(returning: .success([])), menuGrouping: spyClosure)
        let expectation = XCTestExpectation(description: "Expect given closure to be called")
       // action
        viewModel
            .$sections
            .dropFirst()
            .sink { value in
                // assert
                guard case .success(let sections) = value else {
                    return XCTFail("Expected a successful Result, got: \(value)")
                }
                // check that given closure was called
                XCTAssertTrue(called)
                // check that returned value was built with the closure
                XCTAssertEqual(sections, inputSection)
                expectation.fulfill()
            }
            .store(in: &cancellable)
        wait(for: [expectation], timeout: 1)
    }
    
    func testWhenFetchingStartsPublishesEmptyView() throws {
        // arrange
        let viewModel = MenuList.ViewModel(menuFetching: MenuFetchingStub(returning: .success([MenuItem.fixture()])))
        let sections = try viewModel.sections.get()
        
        XCTAssertTrue(sections.isEmpty)
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
        //action
        viewModel
            .$sections
            .dropFirst()
            .sink { value in
                guard case .success(let sections) = value else {
                    return XCTFail("Expected a successful Result, got: \(value)")
                }
                //ensure the grouping closure is called with the received menu
                XCTAssertEqual(receivedMenu, expectedMenu)
                //ensure the publish value is the result of the grouping closure
                XCTAssertEqual(sections, expectedSections)
                expectation.fulfill()
            }
            .store(in: &cancellable)
        wait(for: [expectation], timeout: 1)
    }
    
    func testWhenFetchingFailsPublishesAnError() {
        //assert
        let expectedError = TestError(id: 123)
        let menuFetchingStub = MenuFetchingStub(returning: .failure(expectedError))
        
        let viewModel = MenuList.ViewModel(menuFetching: menuFetchingStub, menuGrouping: { _ in [] })
        
        let expectation = XCTestExpectation(description: "Publishes an error")
        
        //action
        viewModel
            .$sections
            .dropFirst()
            .sink { value in
                guard case .failure(let error) = value else {
                    return XCTFail("expecting a failing Result, got: \(value)")
                }
                XCTAssertEqual(error as? TestError, expectedError)
                expectation.fulfill()
            }
            .store(in: &cancellable)
        wait(for: [expectation], timeout: 1)
    }
}
