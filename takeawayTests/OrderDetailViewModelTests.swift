//
//  OrderDetailViewModelTests.swift
//  takeawayTests
//
//  Created by Krzysztof Jankowski on 06/08/2021.
//

import Foundation
@testable import takeaway
import XCTest

class OrderDetailViewModelTests: XCTestCase {
    
    func testWhenOrderIsEmptyShouldNotShowTotalAmount() {
        let viewModel = OrderDetail.ViewModel(orderController: OrderController(), onAlertDismiss: {})
        
        XCTAssertNil(viewModel.totalText)
    }
    
    func testWhenOrderIsNonEmptyShouldShowTotalAmount() {
        let orderController = OrderController()
        orderController.addToOrder(item: .fixture(price: 1.0))
        orderController.addToOrder(item: .fixture(price: 2.3))
        let viewModel = OrderDetail.ViewModel(orderController: orderController, onAlertDismiss: {})
        
        XCTAssertEqual(viewModel.totalText, "Total: $3.30")
    }
    
    func testWhenOrderIsEmptyHasNotItemNamesToShow() {
        let viewModel = OrderDetail.ViewModel(orderController: OrderController(), onAlertDismiss: {})
        
        XCTAssertEqual(viewModel.menuListItems.count, 0)
    }
    
    func testWhenOrderIsNonEmptyMenuListItemIsOrderItems() {
        let orderController = OrderController()
        orderController.addToOrder(item: .fixture(name: "a name"))
        orderController.addToOrder(item: .fixture(name: "another name"))
        let viewModel = OrderDetail.ViewModel(orderController: orderController, onAlertDismiss: {})
        
        XCTAssertEqual(viewModel.menuListItems.count, 2)
        XCTAssertEqual(viewModel.menuListItems.first?.name, "a name")
        XCTAssertEqual(viewModel.menuListItems.last?.name, "another name")
    }
    
    func testWhenCheckOutButtonTappedStartsPaymentProcessingFlow() {
        //arrange
        
        let orderController = OrderController()
        orderController.addToOrder(item: .fixture(name: "a name"))
        orderController.addToOrder(item: .fixture(name: "another name"))
        
        let paymentProcessingSpy = PaymentProcessingSpy()
        
        let viewModel = OrderDetail.ViewModel(
            orderController: orderController,
            paymentProcessor: paymentProcessingSpy, onAlertDismiss: {})
        
        viewModel.checkout()
        
        XCTAssertEqual(paymentProcessingSpy.receivedOrder, orderController.order)
        
    }
    
    func testWhenPaymentSucceedsUpdatesPropertyToShowConfirmationAlert() {
        let viewModel = OrderDetail.ViewModel(
            orderController: OrderController(),
            paymentProcessor: PaymentProcessingStub(returning: .success(())), onAlertDismiss: {}
        )
        let predicate = NSPredicate {_, _ in
            viewModel.alertToShow != nil
        }
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: .none)
        viewModel.checkout()
        
        wait(for: [expectation], timeout: 2)
        
        XCTAssertEqual(viewModel.alertToShow?.title, "")
        XCTAssertEqual(viewModel.alertToShow?.message, "The payment was successful. Your food will be with you shortly.")
        
        XCTAssertEqual(viewModel.alertToShow?.buttonText, "Ok")
    }
    
    func testWhenPaymentFailsUpdatesPropertyToShowErrorAlert() {
        //arrange
        let viewModel = OrderDetail.ViewModel(
            orderController: OrderController(),
            paymentProcessor: PaymentProcessingStub(returning: .failure(TestError(id: 123))), onAlertDismiss: {})
        
        let predicate = NSPredicate {_, _ in
            viewModel.alertToShow != nil
        }
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: .none)
        //act
        viewModel.checkout()
        
        wait(for: [expectation], timeout: 2)
        
        XCTAssertEqual(viewModel.alertToShow?.title, "")
        XCTAssertEqual(viewModel.alertToShow?.message, "There's been an error with your order. Please contact a waiter.")
        
        XCTAssertEqual(viewModel.alertToShow?.buttonText, "Ok")
    }
    
    func testWhenPaymentSucceedsDismissingTheAlertRunsGivenClosure() {
        //arrange
        var called = false
        let viewModel = OrderDetail.ViewModel(
            orderController: OrderController(),
            paymentProcessor: PaymentProcessingStub(returning: .success(())),
            onAlertDismiss: { called = true }
        )
        
        let predicate = NSPredicate {_, _ in
            viewModel.alertToShow != nil
        }
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: .none)
        
        //act
        viewModel.checkout()
        
        wait(for: [expectation], timeout: 2)
        
        viewModel.alertToShow?.buttonAction?()
        
        XCTAssertTrue(called)
    }
    
    func testWhenPaymentSucceedsDismissingTheAlertResetsTheOrder() {
        //arrange
        let orderController = OrderController()
        orderController.addToOrder(item: .fixture())
        
        let viewModel = OrderDetail.ViewModel(
            orderController: orderController,
            paymentProcessor: PaymentProcessingStub(returning: .success(())),
            onAlertDismiss: {}
        )
        
        let predicate = NSPredicate {_, _ in
            viewModel.alertToShow != nil
        }
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: .none)
        
        viewModel.checkout()
        
        wait(for: [expectation], timeout: 2)
        
        viewModel.alertToShow?.buttonAction?()
        
        XCTAssertTrue(orderController.order.items.isEmpty)
    }
}
