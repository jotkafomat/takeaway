//
//  OrderControllerTests.swift
//  takeawayTests
//
//  Created by Krzysztof Jankowski on 03/08/2021.
//

import Foundation
@testable import takeaway
import XCTest

class OrderControllerTests: XCTestCase {
    
    func testInitsWithEmptyOrder() {
        let controller = OrderController()

        XCTAssertTrue(controller.order.items.isEmpty)
    }
    
    func testWhenItemIsInOrderReturnTrue() {
        //arrange
        let item = MenuItem(name: "water", category: "drink", spicy: false, price: 1.0)
        let orderController = OrderController(orderStoring: OrderStoringFake())
        
        orderController.addToOrder(item: item)
        
        //act
        let result = orderController.isItemInOrder(item)
        
        //assert
        XCTAssertTrue(result)
    }
    
    func testWhenItemIsNotInOrderReturnFalse() {
        //arrange
        let item = MenuItem(name: "water", category: "drink", spicy: false, price: 1.0)
        let item2 = MenuItem.fixture()
        
        let orderController = OrderController(orderStoring: OrderStoringFake())
        orderController.addToOrder(item: item)
        
        //act
        let result = orderController.isItemInOrder(item2)
        
        //assert
        XCTAssertFalse(result)
    }
    
    func testWhenItemIsAddedToOrderIsInTheOrder() {
        //arrange
        let item = MenuItem.fixture()
        let orderController = OrderController(orderStoring: OrderStoringFake())
        
        //act
        orderController.addToOrder(item: item)
        
        //assert
        XCTAssertEqual(orderController.order.items.count, 1)
        
    }
    
    func testWhenItemIsRemovedFromOrderItemIsNotInTheOrder() {
        //arrange
        let item = MenuItem.fixture(name: "water")
        let item2 = MenuItem.fixture(name: "coffee")
        
        let orderController = OrderController(orderStoring: OrderStoringFake())
        orderController.addToOrder(item: item)
        orderController.addToOrder(item: item2)
        //act
        orderController.removeFromOrder(item: item)
        
        //assert
        XCTAssertEqual(orderController.order.items.count, 1)
        XCTAssertEqual(orderController.order.items.first?.name, "coffee")
        
    }
}
