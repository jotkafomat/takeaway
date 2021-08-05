//
//  MenuItemDetail.ViewModelTests.swift
//  takeawayTests
//
//  Created by Krzysztof Jankowski on 05/08/2021.
//

import Foundation
@testable import takeaway
import XCTest

class MenuItemDetailViewModelTests: XCTestCase {
    
    func testWhenItemIsInOrderButtonSaysRemove() {
        //arrange
        let item = MenuItem.fixture()
        let orderController = OrderController()
        orderController.addToOrder(item: item)
        
        let viewModel = MenuItemDetail.ViewModel(item: item, orderController: orderController)
        
        //act
        let text = viewModel.addOrRemoveFromOrderButtonText
        
        //assert
        XCTAssertEqual(text, "Remove from order")
    }
    
    func testWhenItemIsNotInOrderButtonSaysAdd() {
        //arrange
        let item = MenuItem.fixture()
        let orderController = OrderController()
        let viewModel = MenuItemDetail.ViewModel(item: item, orderController: orderController)
        
        //act
        let text = viewModel.addOrRemoveFromOrderButtonText
        
        //assert
        XCTAssertEqual(text, "Add to order")
    }
    
    func testWhenItemIsInOrderButtonActionRemovesIt() {
        //arrange
        let item = MenuItem.fixture()
        let orderController = OrderController()
        orderController.addToOrder(item: item)
        let viewModel = MenuItemDetail.ViewModel(item: item, orderController: orderController)
        
        //act
        viewModel.addOrRemoveFromOrder()
        
        //assert
        XCTAssertFalse(orderController.order.items.contains { $0 == item })
    }
    
    func testWhenItemIsNotInOrderButtonActionAddsIt() {
        //arrange
        let item = MenuItem.fixture()
        let orderController = OrderController()
        let viewModel = MenuItemDetail.ViewModel(item: item, orderController: orderController)
        
        //act
        viewModel.addOrRemoveFromOrder()
        
        //assert
        XCTAssertTrue(orderController.order.items.contains { $0 == item })
    }
}
