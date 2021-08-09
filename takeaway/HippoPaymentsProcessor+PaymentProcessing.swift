//
//  HippoPaymentsProcessor+PaymentProcessing.swift
//  takeaway
//
//  Created by Krzysztof Jankowski on 09/08/2021.
//

import Combine
import HippoPayments

extension HippoPaymentsProcessor: PaymentProcessing {
    func process(order: Order) -> AnyPublisher<Void, Error> {
        return Future { promise in
            self.processPayment(
                payload: order.hippoPaymentsPayload,
                onSuccess: { promise(.success(())) },
                onFailure: { promise(.failure($0))}
            )
        }
        .eraseToAnyPublisher()
    }
    
}
