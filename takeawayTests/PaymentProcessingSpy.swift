//
//  PaymentProcessingSpy.swift
//  takeawayTests
//
//  Created by Krzysztof Jankowski on 09/08/2021.
//

import Combine
@testable import takeaway

class PaymentProcessingSpy: PaymentProcessing {
    
    private(set) var receivedOrder: Order?
    
    func process(order: Order) -> AnyPublisher<Void, Error> {
        receivedOrder = order
        
        return Result<Void, Error>
            .success(())
            .publisher
            .eraseToAnyPublisher()
    }
    
}
