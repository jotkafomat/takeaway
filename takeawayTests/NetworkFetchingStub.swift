//
//  NetworkFetchingStub.swift
//  takeawayTests
//
//  Created by Krzysztof Jankowski on 02/08/2021.
//

import Foundation
@testable import takeaway
import Combine

class NetworkFetchingStub: NetworkFetching {
    
    private let result: Result<Data, URLError>
    
    init(returning result: Result<Data, URLError>) {
        self.result = result
    }
    
    func load(_ request: URLRequest) -> AnyPublisher<Data, URLError> {
        return result.publisher
        //use a delay to simulate the real world async behavior
            .delay(for: 0.01, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
