//
//  MenuFetcherTests.swift
//  takeawayTests
//
//  Created by Krzysztof Jankowski on 02/08/2021.
//

import Foundation
@testable import takeaway
import XCTest
import Combine

class MenuFetcherTests: XCTestCase {
    var cancellable = Set<AnyCancellable>()
    
    func testWhenRequestSucceedsPublishesDecodedMenuItems() throws {
        //arrange
        let json = """
            [
                { "name": "Penne all'Arrabbiata", "category": "pastas", "spicy": true, "price": 4.5 },
                { "name": "Water", "category": "drinks", "spicy": false, "price": 1.0 }
            ]
            """
        let data = try XCTUnwrap(json.data(using:.utf8))
        
        let menuFetcher = MenuFetcher(networkFetching: NetworkFetchingStub(returning: .success(data)))
        
        let expectation = XCTestExpectation(description: "Publishes decoded[MenuItem]")
        // act
        menuFetcher.fetchMenu()
            .sink(
                receiveCompletion: {_ in },
                receiveValue: { items in
                    XCTAssertEqual(items.count, 2)
                    XCTAssertEqual(items.first?.name, "Penne all'Arrabbiata")
                    XCTAssertEqual(items.last?.name, "Water")
                    expectation.fulfill()
                }
            )
            .store(in: &cancellable)
        //assert
        wait(for: [expectation], timeout: 1)
    }
    
    func testWhenRequestFailsPublishesReceivedError() {
        //arrange
        let expectedError = URLError(.badServerResponse)
        let menuFetcher = MenuFetcher(networkFetching: NetworkFetchingStub(returning: .failure(expectedError)))
        
        let expectation = XCTestExpectation(description: "Publishes received URLError")
        
        menuFetcher.fetchMenu()
            .sink(receiveCompletion: { completion in
                guard case .failure(let error) = completion else {
                    return
                }
                XCTAssertEqual(error as? URLError,  expectedError)
                expectation.fulfill()
            }, receiveValue: { items in
                XCTFail("Expected to fail, succeeded with \(items)")
                
            })
            .store(in: &cancellable)
        wait(for: [expectation], timeout: 1)
    }
}
