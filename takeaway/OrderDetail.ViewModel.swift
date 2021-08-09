//
//  OrderDetail.ViewModel.swift
//  takeaway
//
//  Created by Krzysztof Jankowski on 05/08/2021.
//

import Foundation
import HippoPayments

extension OrderDetail {
    
    struct ViewModel {

        let headerText = "Your Order"
        let menuListItems: [MenuItem]
        let emptyMenuFallbackText = "Add dishes to the order to see them here"
        let totalText: String?
        let checkoutButtonText = "Checkout"

        private let orderController: OrderController
        private let paymentProcessor: PaymentProcessing

        init(orderController: OrderController,
             paymentProcessor: PaymentProcessing = HippoPaymentsProcessor.init(apiKey: "A1B2C3")) {
            self.paymentProcessor = paymentProcessor
            self.orderController = orderController
            
            totalText = orderController.order.items.isEmpty
                ? .none
                : "Total: $\(String(format: "%.2f", orderController.order.total))"

            menuListItems = orderController.order.items
        }
        
        func checkout() {
            paymentProcessor.process(order: orderController.order)
        }
    }
}
