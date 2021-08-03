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
        let order = Order(items: [item])
        let orderController = OrderController(order: order)
        
        //act
        let result = orderController.isItemInOrder(item)
        
        //assert
        XCTAssertTrue(result)
    }
    
    func testWhenItemIsNotInOrderReturnFalse() {
        //arrange
        let item = MenuItem(name: "water", category: "drink", spicy: false, price: 1.0)
        let item2 = MenuItem.fixture()
        let order = Order(items: [item])
        let orderController = OrderController(order: order)
        
        //act
        let result = orderController.isItemInOrder(item2)
        
        //assert
        XCTAssertFalse(result)
    }
    
    func testWhenItemIsAddedToOrderIsInTheOrder() {
        //arrange
        let item = MenuItem.fixture()
        let order = Order(items: [])
        let orderController = OrderController(order: order)
        
        //act
        orderController.addToOrder(item: item)
        
        //assert
        XCTAssertEqual(orderController.order.items.count, 1)
        
    }
    
    func testWhenItemIsRemovedFromOrderItemIsNotInTheOrder() {
        //arrange
        let item = MenuItem.fixture(name: "water")
        let item2 = MenuItem.fixture(name: "coffee")
        let order = Order(items: [item, item2])
        let orderController = OrderController(order: order)
        
        //act
        orderController.removeFromOrder(item: item)
        
        //assert
        XCTAssertEqual(orderController.order.items.count, 1)
        XCTAssertEqual(orderController.order.items.first?.name, "coffee")
        
    }
}
