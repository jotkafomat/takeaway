//
//  PaymentProcessing.swift
//  takeaway
//
//  Created by Krzysztof Jankowski on 09/08/2021.
//

import Combine

protocol PaymentProcessing {
    func process(order: Order) -> AnyPublisher<Void, Error>
}
