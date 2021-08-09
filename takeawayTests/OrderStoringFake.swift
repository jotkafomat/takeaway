//
//  OrderStoringFake.swift
//  takeawayTests
//
//  Created by Krzysztof Jankowski on 09/08/2021.
//

import Foundation
@testable import takeaway

class OrderStoringFake: OrderStoring {
    
    private var order: Order = Order(items: [])
    
    func getOrder() -> Order {
        order
    }
    
    func updateOrder(_ order: Order) {
        self.order = order
    }
}
