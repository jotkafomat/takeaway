//
//  PaymentProcessingStub.swift
//  takeawayTests
//
//  Created by Krzysztof Jankowski on 09/08/2021.
//
import Foundation
import Combine
@testable import takeaway

class PaymentProcessingStub: PaymentProcessing {
    
    let result: Result<Void, Error>
    
    init(returning result: Result<Void, Error>) {
        self.result = result
    }
    
    func process(order: Order) -> AnyPublisher<Void, Error> {
        return result
            .publisher
            .delay(for: 0.01, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
