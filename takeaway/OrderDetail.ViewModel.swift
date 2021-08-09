//
//  OrderDetail.ViewModel.swift
//  takeaway
//
//  Created by Krzysztof Jankowski on 05/08/2021.
//

import Foundation
import HippoPayments
import Combine
import SwiftUI


extension OrderDetail {
    
    class ViewModel: ObservableObject {

        let headerText = "Your Order"
        let menuListItems: [MenuItem]
        let emptyMenuFallbackText = "Add dishes to the order to see them here"
        let totalText: String?
        let checkoutButtonText = "Checkout"

        private let orderController: OrderController
        private let paymentProcessor: PaymentProcessing
        
        @Published var alertToShow: Alert.ViewModel?
        private(set) var cancellables = Set<AnyCancellable>()

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
                .sink(
                    receiveCompletion: { [weak self] completion in
                        guard case .failure = completion else { return }
                        self?.alertToShow = Alert.ViewModel(
                            title: "", message: "There's been an error with your order. Please contact a waiter.", buttonText: "Ok")
                    },
                    receiveValue: { [weak self] _ in
                        self?.alertToShow = Alert.ViewModel(
                            title: "",
                            message: "The payment was successful. Your food will be with you shortly.",
                            buttonText: "Ok")
                    }
                )
                .store(in: &cancellables)
        }
    }
}
