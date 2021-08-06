//
//  OrderButtonViewModelTests.swift
//  takeawayTests
//
//  Created by Krzysztof Jankowski on 06/08/2021.
//

import Foundation
@testable import takeaway
import XCTest

class OrderButtonViewModelTests: XCTestCase {
    
    func testWhenOrderIsEmptyDoesNotShowTotal() {
        //arrange
        let orderController = OrderController()
        //act
        let viewModel = OrderButton.ViewModel(orderController: orderController)
        //assert
        
        XCTAssertEqual(viewModel.text, "Your Order")
    }
    
    func testWhenOrderIsNotEmptyShowsTotal() {
        
        //arrange
        let orderController = OrderController()
        orderController.addToOrder(item: .fixture(price: 1.0))
        orderController.addToOrder(item: .fixture(price: 2.3))
        //act
        let viewModel = OrderButton.ViewModel(orderController: orderController)
        //assert
        XCTAssertEqual(viewModel.text, "Your Order $3.30")
    }
}
